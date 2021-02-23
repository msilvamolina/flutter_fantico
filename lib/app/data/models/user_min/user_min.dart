import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_min.freezed.dart';

@freezed
abstract class UserMin implements _$UserMin {
  const UserMin._();

  const factory UserMin({
    @required String email,
    @required String username,
    int racha,
    String image,
  }) = _UserMin;
}
