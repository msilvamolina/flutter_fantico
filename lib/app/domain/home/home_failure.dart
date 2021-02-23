import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_failure.freezed.dart';

@freezed
abstract class HomeFailure with _$HomeFailure {
  const factory HomeFailure.unexpected() = _Unexpected;
  const factory HomeFailure.insufficientPermission() = _InsufficientPermission;
  const factory HomeFailure.unableToUpdate() = _UnableToUpdate;
  const factory HomeFailure.unableBusinessID() = _UnableBusinessID;
  const factory HomeFailure.unableGetBusiness() = _UnableGetBusiness;
  const factory HomeFailure.newAppVersion() = _NewAppVersion;
  const factory HomeFailure.unableGetVersion() = _UnableGetVersion;
  const factory HomeFailure.userBanned() = _UserBanned;
  const factory HomeFailure.unableSaveAdmin() = _UnableSaveAdmin;
  const factory HomeFailure.unableGetToken() = _UnableGetToken;
  const factory HomeFailure.usernameError() = _UsernameError;
  const factory HomeFailure.usernameEmpty() = _UsernameEmpty;
}
