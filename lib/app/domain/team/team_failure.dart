import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_failure.freezed.dart';

@freezed
abstract class TeamFailure with _$TeamFailure {
  const factory TeamFailure.cancelledByUser() = CancelledByUser;
  const factory TeamFailure.serverError() = ServerError;
  const factory TeamFailure.insufficientPermission() = InsufficientPermission;
  const factory TeamFailure.unexpected() = Unexpected;
}
