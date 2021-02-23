import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_streaks_min.freezed.dart';

@freezed
abstract class UserStreakMin implements _$UserStreakMin {
  const UserStreakMin._();

  const factory UserStreakMin({
    @required String userEmail,
    int racha,
    String username,
    String image,
  }) = _UserStreakMin;
}
