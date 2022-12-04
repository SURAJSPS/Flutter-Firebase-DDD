import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/auth/auth_failure.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/auth/i_auth_facade.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/auth/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';


@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInWithEmaiAndPassword>(
        (event, emit) => signInWithEmailAndPassword(event, emit));
    on<RegisterWithEmaiAndPassword>(
        (event, emit) => registerWithEmailAndPassword(event, emit));
    on<EmailChanged>((event, emit) => changeEmailAddres(event, emit));
    on<PasswordChanged>((event, emit) => changePassword(event, emit));
  }
  final IAuthFacade _authFacade;

  void changeEmailAddres(EmailChanged event, Emitter<SignInFormState> emit) {
    emit(
      state.copyWith(
        emailAddress: EmailAddress(event.email),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  void changePassword(PasswordChanged event, Emitter<SignInFormState> emit) {
    emit(
      state.copyWith(
        password: Password(event.password),
        authFailureOrSuccessOption: none(),
      ),
    );
  }

  Future<void> registerWithEmailAndPassword(
      RegisterWithEmaiAndPassword event, Emitter<SignInFormState> emit) async {
    _performActionOnAuthFacadeWithEmailAndPassword(
      right(event),
      emit,
      _authFacade.registerWithEmailAndPassword,
    );
  }

  Future<void> signInWithEmailAndPassword(
      SignInWithEmaiAndPassword event, Emitter<SignInFormState> emit) async {
    _performActionOnAuthFacadeWithEmailAndPassword(
      left(event),
      emit,
      _authFacade.signInWithEmailAndPassword,
    );
  }

  Future<void> signInWithGoogle(
      SignInWithGoogle event, Emitter<SignInFormState> emit) async {
    emit(state.copyWith(
      isSubmitting: true,
      authFailureOrSuccessOption: none(),
    ));
    final failuerOrSuccess = await _authFacade.signInWithGoogle();
    emit(
      state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: some(failuerOrSuccess)),
    );
  }

  Stream<SignInFormState> _performActionOnAuthFacadeWithEmailAndPassword(
    Either<SignInWithEmaiAndPassword, RegisterWithEmaiAndPassword> event,
    Emitter<SignInFormState> emit,
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwordedCall,
  ) async* {
    Either<AuthFailure, Unit>? failureOrSuccess;

    final isEmailValid = state.emailAddress.isValid();

    final isPasswordValid = state.password.isValid();

    if (isEmailValid && isPasswordValid) {
      emit(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await forwordedCall(
        emailAddress: state.emailAddress,
        password: state.password,
      );

      emit(
        state.copyWith(
          isSubmitting: false,
          showErrorMessage: true,
          authFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
    }
  }
}
