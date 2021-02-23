import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_streak_failure.freezed.dart';

@freezed
abstract class UserStreakFailure with _$UserStreakFailure {
  const factory UserStreakFailure.unexpected() = _Unexpected;
  const factory UserStreakFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory UserStreakFailure.unableToUpdate() = _UnableToUpdate;
  const factory UserStreakFailure.empty() = _Empty;
}
