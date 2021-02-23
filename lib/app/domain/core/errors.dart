import 'failures.dart';

class NotAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encontramos un error en un punto irrecuperable. Finalizando ejecución';
    ;
    return Error.safeToString('$explanation El error fue: $valueFailure');
  }
}
