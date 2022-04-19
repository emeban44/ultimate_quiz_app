// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      imageURL: json['image_url'] as String?,
      numberOfWins: json['broj_pobjeda'] as int?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'username': instance.username,
      'image_url': instance.imageURL,
      'broj_pobjeda': instance.numberOfWins,
    };
