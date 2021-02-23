import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPasswordCombination() =
      InvalidEmailAndPasswordCombination;
  const factory AuthFailure.insufficientPermission() = InsufficientPermission;
  const factory AuthFailure.unableToGetEmail() = UnableToGetEmail;
  const factory AuthFailure.unexpected() = Unexpected;
  const factory AuthFailure.saveUserError() = SaveUserError;
  const factory AuthFailure.metodoInicioDeSesionNoDisponible() =
      MetodoInicioDeSesionNoDisponible;
  const factory AuthFailure.getUsernameCloudServerError() =
      GetUsernameCloudServerError;
  const factory AuthFailure.getUsernameCloudErrorUnknow() =
      GetUsernameCloudErrorUnknow;
  const factory AuthFailure.usernameAlreadyInUse() = UsernameAlreadyInUse;

  const factory AuthFailure.fbOperationInProgress() = FbOperationInProgress;
}
