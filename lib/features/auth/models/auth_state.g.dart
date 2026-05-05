// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
  status: $enumDecode(_$AuthStatusEnumMap, json['status']),
  user: json['user'] == null
      ? null
      : UserProfile.fromJson(json['user'] as Map<String, dynamic>),
  error: json['error'] as String?,
  isLoading: json['isLoading'] as bool? ?? false,
  lastLoginAt: json['lastLoginAt'] == null
      ? null
      : DateTime.parse(json['lastLoginAt'] as String),
);

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
  'status': _$AuthStatusEnumMap[instance.status]!,
  'user': instance.user,
  'error': instance.error,
  'isLoading': instance.isLoading,
  'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
};

const _$AuthStatusEnumMap = {
  AuthStatus.unauthenticated: 'unauthenticated',
  AuthStatus.authenticating: 'authenticating',
  AuthStatus.authenticated: 'authenticated',
  AuthStatus.error: 'error',
};
