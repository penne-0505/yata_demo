// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthConfig _$AuthConfigFromJson(Map<String, dynamic> json) => AuthConfig(
  supabaseUrl: json['supabaseUrl'] as String,
  supabaseAnonKey: json['supabaseAnonKey'] as String,
  callbackUrl: json['callbackUrl'] as String,
  platform: $enumDecode(_$AuthPlatformEnumMap, json['platform']),
  scopes:
      (json['scopes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>["email", "openid"],
);

Map<String, dynamic> _$AuthConfigToJson(AuthConfig instance) =>
    <String, dynamic>{
      'supabaseUrl': instance.supabaseUrl,
      'supabaseAnonKey': instance.supabaseAnonKey,
      'callbackUrl': instance.callbackUrl,
      'platform': _$AuthPlatformEnumMap[instance.platform]!,
      'scopes': instance.scopes,
    };

const _$AuthPlatformEnumMap = {
  AuthPlatform.web: 'web',
  AuthPlatform.android: 'android',
  AuthPlatform.ios: 'ios',
  AuthPlatform.desktop: 'desktop',
  AuthPlatform.other: 'other',
};
