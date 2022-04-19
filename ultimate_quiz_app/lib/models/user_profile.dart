import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  UserProfile({
    this.imageURL,
    this.numberOfWins,
    this.username,
  });

  factory UserProfile.fromJson(dynamic json) =>
      _$UserProfileFromJson(json as Map<String, dynamic>);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);

  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'image_url')
  String? imageURL;
  @JsonKey(name: 'broj_pobjeda')
  int? numberOfWins;
}
