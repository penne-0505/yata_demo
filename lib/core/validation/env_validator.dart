import "package:flutter/foundation.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";

import "env_platform.dart";

/// 環境変数の検証結果
class EnvValidationResult {
  const EnvValidationResult({
    required this.isValid,
    required this.errors,
    required this.warnings,
    required this.info,
  });

  /// 検証が成功したかどうか
  final bool isValid;

  /// エラーメッセージのリスト
  final List<String> errors;

  /// 警告メッセージのリスト
  final List<String> warnings;

  /// 情報メッセージのリスト
  final List<String> info;

  /// エラーがあるかどうか
  bool get hasErrors => errors.isNotEmpty;

  /// 警告があるかどうか
  bool get hasWarnings => warnings.isNotEmpty;

  /// 情報があるかどうか
  bool get hasInfo => info.isNotEmpty;
}

/// 環境変数検証ユーティリティ
///
/// アプリケーション起動時に必要な環境変数が正しく設定されているかを検証します。
class EnvValidator {
  EnvValidator._();

  /// 内部ログ出力（循環インポート回避のため、直接printを使用）
  static void _log(String message, [Object? error, StackTrace? stackTrace]) {
    if (!kDebugMode) {
      return;
    }

    debugPrint("[EnvValidator] $message");
    if (error != null) {
      debugPrint("[EnvValidator] Error: $error");
    }
    if (stackTrace != null) {
      debugPrint("[EnvValidator] StackTrace: $stackTrace");
    }
  }

  /// コンソール出力用ユーティリティ。
  static void _emitConsole(String message) {
    debugPrintSynchronously(message);
  }

  /// 必須の環境変数リスト
  static const List<String> _requiredVars = <String>["SUPABASE_URL", "SUPABASE_ANON_KEY"];

  /// オプションの環境変数リスト
  static const List<String> _optionalVars = <String>[
    "SUPABASE_OAUTH_CALLBACK_URL_DEV",
    "SUPABASE_OAUTH_CALLBACK_URL_PROD",
    "SUPABASE_OAUTH_CALLBACK_URL_MOBILE",
    "SUPABASE_OAUTH_CALLBACK_URL_DESKTOP",
    "DEBUG_MODE",
    "LOG_LEVEL",
    "LOG_DIR",
    "LOG_FLUSH_INTERVAL_MS",
    "LOG_MAX_QUEUE",
    "LOG_MAX_FILE_SIZE_MB",
    "LOG_MAX_DISK_MB",
    "LOG_RETENTION_DAYS",
    "LOG_BACKPRESSURE",
    "ORDER_MANAGEMENT_PERF_TRACING",
    "ORDER_MANAGEMENT_PERF_SAMPLE_MODULO",
  ];

  /// dart-define から注入されるビルド時環境変数のデフォルト値
  static const Map<String, String> _dartDefineDefaults = <String, String>{
    "SUPABASE_URL": String.fromEnvironment("SUPABASE_URL"),
    "SUPABASE_ANON_KEY": String.fromEnvironment("SUPABASE_ANON_KEY"),
    "SUPABASE_OAUTH_CALLBACK_URL_DEV": String.fromEnvironment("SUPABASE_OAUTH_CALLBACK_URL_DEV"),
    "SUPABASE_OAUTH_CALLBACK_URL_PROD": String.fromEnvironment("SUPABASE_OAUTH_CALLBACK_URL_PROD"),
    "SUPABASE_OAUTH_CALLBACK_URL_MOBILE": String.fromEnvironment(
      "SUPABASE_OAUTH_CALLBACK_URL_MOBILE",
    ),
    "SUPABASE_OAUTH_CALLBACK_URL_DESKTOP": String.fromEnvironment(
      "SUPABASE_OAUTH_CALLBACK_URL_DESKTOP",
    ),
    "SUPABASE_AUTH_CALLBACK_URL": String.fromEnvironment("SUPABASE_AUTH_CALLBACK_URL"),
    "DEBUG_MODE": String.fromEnvironment("DEBUG_MODE"),
    "LOG_LEVEL": String.fromEnvironment("LOG_LEVEL"),
    "LOG_DIR": String.fromEnvironment("LOG_DIR"),
    "LOG_FLUSH_INTERVAL_MS": String.fromEnvironment("LOG_FLUSH_INTERVAL_MS"),
    "LOG_MAX_QUEUE": String.fromEnvironment("LOG_MAX_QUEUE"),
    "LOG_MAX_FILE_SIZE_MB": String.fromEnvironment("LOG_MAX_FILE_SIZE_MB"),
    "LOG_MAX_DISK_MB": String.fromEnvironment("LOG_MAX_DISK_MB"),
    "LOG_RETENTION_DAYS": String.fromEnvironment("LOG_RETENTION_DAYS"),
    "LOG_BACKPRESSURE": String.fromEnvironment("LOG_BACKPRESSURE"),
    "ORDER_MANAGEMENT_PERF_TRACING": String.fromEnvironment("ORDER_MANAGEMENT_PERF_TRACING"),
    "LOG_FATAL_FLUSH_BEFORE_HANDLERS": String.fromEnvironment("LOG_FATAL_FLUSH_BEFORE_HANDLERS"),
    "LOG_FATAL_FLUSH_TIMEOUT_MS": String.fromEnvironment("LOG_FATAL_FLUSH_TIMEOUT_MS"),
    "LOG_FATAL_HANDLER_TIMEOUT_MS": String.fromEnvironment("LOG_FATAL_HANDLER_TIMEOUT_MS"),
    "LOG_FATAL_AUTO_SHUTDOWN": String.fromEnvironment("LOG_FATAL_AUTO_SHUTDOWN"),
    "LOG_FATAL_EXIT_PROCESS": String.fromEnvironment("LOG_FATAL_EXIT_PROCESS"),
    "LOG_FATAL_EXIT_CODE": String.fromEnvironment("LOG_FATAL_EXIT_CODE"),
    "LOG_FATAL_SHUTDOWN_DELAY_MS": String.fromEnvironment("LOG_FATAL_SHUTDOWN_DELAY_MS"),
  };

  static Map<String, String> _cachedEnv = _initializeCachedEnv();
  static bool _fileFallbackAttempted = false;

  /// 現在利用可能な環境変数のスナップショット
  static Map<String, String> get env => Map<String, String>.unmodifiable(_cachedEnv);

  /// 環境変数を検証
  static EnvValidationResult validate() {
    _log("環境変数検証を開始");
    final List<String> errors = <String>[];
    final List<String> warnings = <String>[];
    final List<String> info = <String>[];

    // 必須環境変数のチェック
    for (final String varName in _requiredVars) {
      final String? value = _cachedEnv[varName];

      if (value == null || value.isEmpty) {
        errors.add("必須環境変数 '$varName' が設定されていません");
        _log("必須環境変数が未設定: $varName");
      } else {
        // 値の形式チェック
        _validateVarFormat(varName, value, errors, warnings);
        info.add("✓ $varName: 設定済み");
        _log("必須環境変数設定確認: $varName");
      }
    }

    // オプション環境変数のチェック
    for (final String varName in _optionalVars) {
      final String? value = _cachedEnv[varName];

      if (value == null || value.isEmpty) {
        warnings.add("オプション環境変数 '$varName' が設定されていません");
        _log("オプション環境変数が未設定: $varName");
      } else {
        _validateVarFormat(varName, value, errors, warnings);
        info.add("✓ $varName: $value");
        _log("オプション環境変数設定確認: $varName=$value");
      }
    }

    // 環境別チェック
    _validateEnvironmentSpecific(errors, warnings, info);

    final EnvValidationResult result = EnvValidationResult(
      isValid: errors.isEmpty,
      errors: errors,
      warnings: warnings,
      info: info,
    );

    _log(
      "環境変数検証完了: 結果=${result.isValid ? '成功' : '失敗'}, エラー数=${errors.length}, 警告数=${warnings.length}",
    );
    return result;
  }

  /// 環境変数の形式を検証
  static void _validateVarFormat(
    String varName,
    String value,
    List<String> errors,
    List<String> warnings,
  ) {
    switch (varName) {
      case "SUPABASE_URL":
        if (!value.startsWith("https://") || !value.contains("supabase.co")) {
          errors.add("SUPABASE_URLの形式が正しくありません: $value");
        }
        break;

      case "SUPABASE_ANON_KEY":
        if (!value.startsWith("eyJ")) {
          errors.add("SUPABASE_ANON_KEYの形式が正しくありません（JWTトークンではない）");
        }
        break;

      case "SUPABASE_OAUTH_CALLBACK_URL_DEV":
        if (!value.startsWith("http://localhost:")) {
          warnings.add("開発用コールバックURLは通常 http://localhost:8080 です");
        }
        break;

      case "SUPABASE_OAUTH_CALLBACK_URL_PROD":
        if (value == "https://yourdomain.com") {
          warnings.add("本番用コールバックURLがデフォルト値のままです");
        } else if (!value.startsWith("https://")) {
          errors.add("本番用コールバックURLはHTTPS必須です: $value");
        }
        break;

      case "SUPABASE_OAUTH_CALLBACK_URL_DESKTOP":
        final Uri? desktopUri = Uri.tryParse(value);
        if (desktopUri == null || desktopUri.host.isEmpty) {
          warnings.add("デスクトップ用コールバックURLの形式が不正です: $value");
        } else if (desktopUri.scheme != "http") {
          warnings.add("デスクトップ用コールバックURLは http スキームを推奨します: $value");
        } else if (desktopUri.host != "localhost" && desktopUri.host != "127.0.0.1") {
          warnings.add("デスクトップ用コールバックURLは localhost へのループバックを推奨します: $value");
        } else if (!desktopUri.hasPort) {
          warnings.add("デスクトップ用コールバックURLにポート番号を指定してください");
        }
        break;

      case "DEBUG_MODE":
        if (value != "true" && value != "false") {
          warnings.add("DEBUG_MODEは 'true' または 'false' である必要があります: $value");
        }
        break;

      case "LOG_LEVEL":
        const List<String> validLevels = <String>[
          "trace",
          "debug",
          "info",
          "warn",
          "error",
          "fatal",
        ];
        if (!validLevels.contains(value.toLowerCase())) {
          warnings.add("LOG_LEVELは ${validLevels.join(', ')} のいずれかである必要があります: $value");
        }
        break;

      case "LOG_FLUSH_INTERVAL_MS":
      case "LOG_MAX_QUEUE":
      case "LOG_MAX_FILE_SIZE_MB":
      case "LOG_MAX_DISK_MB":
      case "LOG_RETENTION_DAYS":
        final int? numValue = int.tryParse(value);
        if (numValue == null || numValue < 0) {
          warnings.add("$varName は正の整数である必要があります: $value");
        }
        break;

      case "LOG_BACKPRESSURE":
        const List<String> validPolicies = <String>["drop-oldest", "drop-newest", "block"];
        if (!validPolicies.contains(value.toLowerCase())) {
          warnings.add("LOG_BACKPRESSUREは ${validPolicies.join(', ')} のいずれかである必要があります: $value");
        }
        break;

      case "ORDER_MANAGEMENT_PERF_TRACING":
        if (value.toLowerCase() != "true" &&
            value.toLowerCase() != "false" &&
            value != "1" &&
            value != "0") {
          warnings.add("ORDER_MANAGEMENT_PERF_TRACING は true/false (または 1/0) で指定してください: $value");
        }
        break;
    }
  }

  /// 環境別の設定を検証
  static void _validateEnvironmentSpecific(
    List<String> errors,
    List<String> warnings,
    List<String> info,
  ) {
    // デバッグモードの確認
    final bool isDebugMode = kDebugMode;
    info.add("🔧 実行環境: ${isDebugMode ? 'デバッグ' : 'リリース'}");

    // プラットフォームの確認
    if (kIsWeb) {
      info.add("🌐 プラットフォーム: Web");
      // Web特有のチェック
      final String? devUrl = _cachedEnv["SUPABASE_OAUTH_CALLBACK_URL_DEV"];
      if (devUrl != null && !devUrl.startsWith("http://localhost:")) {
        warnings.add("Web開発環境では localhost のコールバックURLが推奨されます");
      }
    } else {
      final String platform = defaultTargetPlatform.name;
      info
        ..add("💻 プラットフォーム: $platform")
        ..add("📱 カスタムスキーム: com.example.yata://login (自動設定)");
    }

    // 本番環境の準備状況
    final String? prodUrl = _cachedEnv["SUPABASE_OAUTH_CALLBACK_URL_PROD"];
    if (prodUrl == null || prodUrl == "https://yourdomain.com") {
      warnings.add("本番環境の準備が完了していません（コールバックURL未設定）");
    } else {
      info.add("🚀 本番環境準備完了: $prodUrl");
    }
  }

  /// 検証結果をコンソールに出力
  static void printValidationResult(EnvValidationResult result) {
    _emitConsole("========================================");
    _emitConsole("🔍 環境変数検証結果");
    _emitConsole("========================================");

    if (result.hasErrors) {
      _emitConsole("❌ エラー:");
      for (final String error in result.errors) {
        _emitConsole("   $error");
      }
    }

    if (result.hasWarnings) {
      _emitConsole("⚠️  警告:");
      for (final String warning in result.warnings) {
        _emitConsole("   $warning");
      }
    }

    if (result.hasInfo) {
      _emitConsole("ℹ️  情報:");
      for (final String info in result.info) {
        _emitConsole("   $info");
      }
    }

    _emitConsole("========================================");
    if (result.isValid) {
      _emitConsole("✅ 環境変数検証: 成功");
    } else {
      _emitConsole("❌ 環境変数検証: 失敗");
    }
    _emitConsole("========================================");
  }

  /// .env.example ファイルと比較して不足している変数をチェック
  static List<String> getMissingVarsFromExample() {
    // 実装は簡略化（実際にはファイルを読み込んで解析）
    final List<String> missing = <String>[];

    for (final String varName in _requiredVars) {
      if (_cachedEnv[varName] == null) {
        missing.add(varName);
      }
    }

    return missing;
  }

  // =================================================================
  // 統合環境変数アクセサ機能
  // =================================================================

  /// 環境変数の初期化（flutter_dotenv）
  ///
  /// アプリケーション起動時に一度呼び出してください
  static Future<void> initialize() async {
    final Map<String, String> systemEnv = _readSystemEnvironment();
    final Map<String, String> dartDefineEnv = _readDartDefineEnvironment();
    Map<String, String> fileEnv = <String, String>{};

    try {
      await dotenv.load();
      fileEnv = Map<String, String>.from(dotenv.env);
      _log(".envファイルから${fileEnv.length}個の環境変数を読み込みました");
    } on FlutterError catch (error, stackTrace) {
      _log(".envファイルの読み込みに失敗しました", error, stackTrace);
      // Flutterアセットとしての読み込みに失敗した場合は、直接ファイルからの読み込みを試みる
      fileEnv = loadFromFile();
    }

    final Map<String, String> mergedEnv = mergeEnvironments(
      fileEnv,
      systemEnv: systemEnv,
      dartDefineEnv: dartDefineEnv,
    );

    _cachedEnv = Map<String, String>.from(mergedEnv);
    _fileFallbackAttempted = true;
    _log(
      "環境変数を初期化しました (system=${systemEnv.length}, file=${fileEnv.length}, merged=${mergedEnv.length})",
    );
  }

  static Map<String, String> _initializeCachedEnv() {
    final Map<String, String> initial = <String, String>{};
    initial.addAll(_readDartDefineEnvironment());
    initial.addAll(_readSystemEnvironment());
    return initial;
  }

  /// 汎用環境変数取得
  ///
  /// [key] 環境変数名
  /// [defaultValue] デフォルト値（オプション）
  /// 戻り値: 環境変数の値またはデフォルト値
  static String getEnv(String key, {String defaultValue = ""}) {
    final String? value = _cachedEnv[key];
    if ((value == null || value.isEmpty) && !_fileFallbackAttempted) {
      final Map<String, String> fileEnv = loadFromFile();
      if (fileEnv.isNotEmpty) {
        final Map<String, String> merged = mergeEnvironments(
          fileEnv,
          systemEnv: _readSystemEnvironment(),
          dartDefineEnv: _readDartDefineEnvironment(),
        );
        _cachedEnv = Map<String, String>.from(merged);
      }
      _fileFallbackAttempted = true;
    }

    final String? resolvedValue = _cachedEnv[key];
    if (resolvedValue == null || resolvedValue.isEmpty) {
      if (defaultValue.isNotEmpty) {
        _log("環境変数 '$key' が未設定のため、デフォルト値を使用: $defaultValue");
      }
      return defaultValue;
    }
    return resolvedValue;
  }

  /// boolean型環境変数の取得
  ///
  /// [key] 環境変数名
  /// [defaultValue] デフォルト値（オプション）
  /// 戻り値: boolean値
  static bool getBoolEnv(String key, {bool defaultValue = false}) {
    final String value = getEnv(key).toLowerCase();
    if (value.isEmpty) {
      return defaultValue;
    }
    return value == "true" || value == "1" || value == "yes" || value == "on";
  }

  /// int型環境変数の取得
  ///
  /// [key] 環境変数名
  /// [defaultValue] デフォルト値（オプション）
  /// 戻り値: int値
  static int getIntEnv(String key, {int defaultValue = 0}) {
    final String value = getEnv(key);
    return int.tryParse(value) ?? defaultValue;
  }

  // =================================================================
  // Supabase設定アクセサ（統合済み）
  // =================================================================

  /// SupabaseのURL
  static String get supabaseUrl => getEnv("SUPABASE_URL");

  /// Supabaseの匿名キー
  static String get supabaseAnonKey => getEnv("SUPABASE_ANON_KEY");

  /// Supabase認証コールバックURL
  static String get supabaseAuthCallbackUrl => getEnv("SUPABASE_AUTH_CALLBACK_URL");

  /// 開発用コールバックURL
  static String get supabaseOAuthCallbackUrlDev => getEnv("SUPABASE_OAUTH_CALLBACK_URL_DEV");

  /// 本番用コールバックURL
  static String get supabaseOAuthCallbackUrlProd => getEnv("SUPABASE_OAUTH_CALLBACK_URL_PROD");

  // =================================================================
  // ログ設定アクセサ（統合済み）
  // =================================================================

  /// デバッグモードの取得
  static bool get debugMode => getBoolEnv("DEBUG_MODE", defaultValue: kDebugMode);

  /// ログレベルの取得
  static String get logLevel => getEnv("LOG_LEVEL", defaultValue: "info");

  /// ログディレクトリの取得
  static String get logDir => getEnv("LOG_DIR");

  /// ログフラッシュ間隔（ミリ秒）
  static int get logFlushIntervalMs => getIntEnv("LOG_FLUSH_INTERVAL_MS", defaultValue: 3000);

  /// ログキューの最大サイズ
  static int get logMaxQueue => getIntEnv("LOG_MAX_QUEUE", defaultValue: 5000);

  /// ログファイルの最大サイズ（MB）
  static int get logMaxFileSizeMb => getIntEnv("LOG_MAX_FILE_SIZE_MB", defaultValue: 5);

  /// ログの最大ディスク使用量（MB）
  static int get logMaxDiskMb => getIntEnv("LOG_MAX_DISK_MB", defaultValue: 50);

  /// ログ保持日数
  static int get logRetentionDays => getIntEnv("LOG_RETENTION_DAYS", defaultValue: 10);

  /// ログバックプレッシャーポリシー
  static String get logBackpressure => getEnv("LOG_BACKPRESSURE", defaultValue: "drop-oldest");

  /// 注文管理トレーシングの有効状態
  static bool get orderManagementPerfTracing => getBoolEnv("ORDER_MANAGEMENT_PERF_TRACING");

  // =================================================================
  // 代替環境ローダー機能（DotEnvLoader統合）
  // =================================================================

  /// ファイルパスから直接環境変数を読み込み（flutter_dotenv の代替）
  ///
  /// [path] .envファイルのパス（オプション、デフォルトは ".env"）
  /// 戻り値: 環境変数のMap
  static Map<String, String> loadFromFile({String? path}) {
    final Map<String, String> env = loadEnvFromFile(path: path);
    if (env.isEmpty) {
      _log(".envファイルが見つからないか、空です: ${path ?? '.env'}");
    } else {
      _log("${env.length}個の環境変数を読み込みました: ${path ?? '.env'}");
    }
    return env;
  }

  /// 環境変数をシステム環境とマージ
  ///
  /// [fileEnv] ファイルから読み込んだ環境変数
  /// [overrideSystem] システム環境変数を上書きするかどうか
  /// 戻り値: マージされた環境変数Map
  static Map<String, String> mergeEnvironments(
    Map<String, String> fileEnv, {
    bool overrideSystem = false,
    Map<String, String>? systemEnv,
    Map<String, String>? dartDefineEnv,
  }) {
    final Map<String, String> merged = <String, String>{};
    final Map<String, String> defines = dartDefineEnv ?? _readDartDefineEnvironment();
    final Map<String, String> baseEnv = systemEnv ?? _readSystemEnvironment();

    if (overrideSystem) {
      if (baseEnv.isNotEmpty) {
        merged.addAll(baseEnv);
      }
      if (defines.isNotEmpty) {
        merged.addAll(defines);
      }
      if (fileEnv.isNotEmpty) {
        merged.addAll(fileEnv);
      }
    } else {
      if (fileEnv.isNotEmpty) {
        merged.addAll(fileEnv);
      }
      if (defines.isNotEmpty) {
        merged.addAll(defines);
      }
      if (baseEnv.isNotEmpty) {
        merged.addAll(baseEnv);
      }
    }

    return merged;
  }

  static Map<String, String> _readDartDefineEnvironment() {
    final Map<String, String> env = <String, String>{};
    _dartDefineDefaults.forEach((String key, String value) {
      if (value.isNotEmpty) {
        env[key] = value;
      }
    });
    return env;
  }

  static Map<String, String> _readSystemEnvironment() {
    try {
      return readSystemEnvironment();
    } on UnsupportedError catch (error, stackTrace) {
      _log("システム環境変数へのアクセスがサポートされていないプラットフォームです", error, stackTrace);
      return <String, String>{};
    }
  }
}
