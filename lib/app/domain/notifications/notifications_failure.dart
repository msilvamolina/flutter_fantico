import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_failure.freezed.dart';

@freezed
abstract class NotificationsFailure with _$NotificationsFailure {
  const factory NotificationsFailure.unexpected() = _Unexpected;
  const factory NotificationsFailure.insufficientPermission() =
      _InsufficientPermission;
  const factory NotificationsFailure.unableToUpdate() = _UnableToUpdate;
  const factory NotificationsFailure.empty() = _Empty;
}
