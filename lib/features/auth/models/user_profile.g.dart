// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
  email: json['email'] as String,
  displayName: json['displayName'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  provider: json['provider'] as String?,
  providerId: json['providerId'] as String?,
  emailVerified: json['emailVerified'] as bool? ?? false,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  lastSignInAt: json['lastSignInAt'] == null
      ? null
      : DateTime.parse(json['lastSignInAt'] as String),
  metadata: json['metadata'] as Map<String, dynamic>?,
  id: json['id'] as String?,
  userId: json['userId'] as String?,
);

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'email': instance.email,
      'displayName': instance.displayName,
      'avatarUrl': instance.avatarUrl,
      'provider': instance.provider,
      'providerId': instance.providerId,
      'emailVerified': instance.emailVerified,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'lastSignInAt': instance.lastSignInAt?.toIso8601String(),
      'metadata': instance.metadata,
    };
