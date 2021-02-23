import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_public_profile_failure.freezed.dart';

@freezed
abstract class UserPublicProfileFailure with _$UserPublicProfileFailure {
  const factory UserPublicProfileFailure.unexpected() = _Unexpected;
  const factory UserPublicProfileFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory UserPublicProfileFailure.unableToUpdate() = _UnableToUpdate;
  const factory UserPublicProfileFailure.empty() = _Empty;
}
