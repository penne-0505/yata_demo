// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  success: json['success'] as bool,
  user: json['user'] == null
      ? null
      : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
  session: json['session'] == null
      ? null
      : AuthSession.fromJson(json['session'] as Map<String, dynamic>),
  error: json['error'] as String?,
  errorDescription: json['errorDescription'] as String?,
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'user': instance.user,
      'session': instance.session,
      'error': instance.error,
      'errorDescription': instance.errorDescription,
      'timestamp': instance.timestamp.toIso8601String(),
    };

AuthSession _$AuthSessionFromJson(Map<String, dynamic> json) => AuthSession(
  accessToken: json['accessToken'] as String,
  tokenType: json['tokenType'] as String,
  expiresIn: (json['expiresIn'] as num).toInt(),
  expiresAt: DateTime.parse(json['expiresAt'] as String),
  refreshToken: json['refreshToken'] as String?,
  user: json['user'] == null
      ? null
      : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
  providerToken: json['providerToken'] as String?,
  providerRefreshToken: json['providerRefreshToken'] as String?,
);

Map<String, dynamic> _$AuthSessionToJson(AuthSession instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'expiresAt': instance.expiresAt.toIso8601String(),
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'providerToken': instance.providerToken,
      'providerRefreshToken': instance.providerRefreshToken,
    };
