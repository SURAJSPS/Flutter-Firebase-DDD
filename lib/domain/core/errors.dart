import 'package:flutter_firebase_ddd_with_bloc/domain/core/failure.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation = "Encountered a ValueFailure at an unrecoverable point.";

    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
