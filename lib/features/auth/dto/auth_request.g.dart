// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequest _$AuthRequestFromJson(Map<String, dynamic> json) => AuthRequest(
  provider: $enumDecode(_$AuthProviderEnumMap, json['provider']),
  redirectTo: json['redirectTo'] as String,
  scopes:
      (json['scopes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>["email", "openid"],
  state: json['state'] as String?,
  queryParams:
      (json['queryParams'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ) ??
      const <String, String>{},
);

Map<String, dynamic> _$AuthRequestToJson(AuthRequest instance) =>
    <String, dynamic>{
      'provider': _$AuthProviderEnumMap[instance.provider]!,
      'redirectTo': instance.redirectTo,
      'scopes': instance.scopes,
      'state': instance.state,
      'queryParams': instance.queryParams,
    };

const _$AuthProviderEnumMap = {
  AuthProvider.google: 'google',
  AuthProvider.email: 'email',
};

LogoutRequest _$LogoutRequestFromJson(Map<String, dynamic> json) =>
    LogoutRequest(
      allDevices: json['allDevices'] as bool? ?? false,
      redirectTo: json['redirectTo'] as String?,
    );

Map<String, dynamic> _$LogoutRequestToJson(LogoutRequest instance) =>
    <String, dynamic>{
      'allDevices': instance.allDevices,
      'redirectTo': instance.redirectTo,
    };
