import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/auth/auth_failure.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/auth/value_object.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}


