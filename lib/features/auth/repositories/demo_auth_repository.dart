import "../../../core/contracts/auth/auth_repository_contract.dart" as contract;
import "../dto/auth_response.dart";
import "../models/user_profile.dart";

/// デモ展示用の固定ユーザー認証リポジトリ。
///
/// Supabase Auth や OAuth フローへ接続せず、常に単一の `demo-user` を
/// 有効セッションとして返す。公開デモの起動直後に業務フローへ入るための実装。
class DemoAuthRepository
    implements contract.AuthRepositoryContract<UserProfile, AuthResponse> {
  DemoAuthRepository({DateTime? now})
    : _createdAt = now ?? DateTime.now(),
      _expiresAt = (now ?? DateTime.now()).add(_sessionDuration);

  static const String demoUserId = "demo-user";
  static const String demoEmail = "demo@yata.local";
  static const Duration _sessionDuration = Duration(days: 3650);

  final DateTime _createdAt;
  final DateTime _expiresAt;

  late final UserProfile _user = UserProfile(
    id: demoUserId,
    userId: demoUserId,
    email: demoEmail,
    displayName: "YATA Demo User",
    provider: "demo",
    providerId: demoUserId,
    emailVerified: true,
    createdAt: _createdAt,
    updatedAt: _createdAt,
    lastSignInAt: _createdAt,
    metadata: const <String, dynamic>{"mode": "demo"},
  );

  UserProfile get currentUser => _user;

  AuthSession get _session => AuthSession(
    accessToken: "demo-access-token",
    tokenType: "bearer",
    expiresIn: _expiresAt.difference(DateTime.now()).inSeconds,
    expiresAt: _expiresAt,
    refreshToken: "demo-refresh-token",
    user: _user,
  );

  @override
  Future<AuthResponse> signInWithGoogle() async =>
      AuthResponse.success(user: _user, session: _session);

  @override
  Future<AuthResponse> handleOAuthCallback(String callbackUrl) async =>
      AuthResponse.success(user: _user, session: _session);

  @override
  Future<UserProfile?> getCurrentUserProfile() async => _user;

  @override
  bool isSessionValid() => DateTime.now().isBefore(_expiresAt);

  @override
  int getSessionRemainingSeconds() {
    final int seconds = _expiresAt.difference(DateTime.now()).inSeconds;
    return seconds > 0 ? seconds : 0;
  }

  @override
  Future<AuthResponse> refreshSession() async =>
      AuthResponse.success(user: _user, session: _session);

  @override
  Future<void> signOut({bool allDevices = false}) async {
    // デモでは sign out を永続化しない。AuthService 側の一時 state 初期化だけ許容する。
  }
}
