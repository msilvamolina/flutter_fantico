import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_failure.freezed.dart';

@freezed
abstract class ChatFailure with _$ChatFailure {
  const factory ChatFailure.cancelledByUser() = CancelledByUser;
  const factory ChatFailure.serverError() = ServerError;
  const factory ChatFailure.insufficientPermission() = InsufficientPermission;
  const factory ChatFailure.unexpected() = Unexpected;
}
