import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String email,
    @Default('') String displayName,
    @Default('') String phoneNumber,
    @Default('') String photoUrl,
    @Default('user') String role, // user, admin, moderator
    @Default([]) List<String> favoriteTemples,
    @Default([]) List<String> favoriteGranths,
    @Default(false) bool emailVerified,
    @Default(true) bool isActive,
    DateTime? createdAt,
    DateTime? lastLoginAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
}
