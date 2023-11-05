import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:shop_app/shop_app.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginUsernameChanged>(_onUsernameChanged);
    on<LoginPhoneNumberChanged>(_onPhoneNumberChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
    on<LoginRememberMeChanged>(_onRememberMeChanged);
    on<LoginForgotPassword>(_onForgotPassword);
    on<LoginWithGoogleAccount>(_onLoginWithGoogleAccount);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onUsernameChanged(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(value: event.username);
    emit(
      state.copyWith(
        username: username,
      ),
    );
  }

  void _onPhoneNumberChanged(
      LoginPhoneNumberChanged event, Emitter<LoginState> emit) {
    final phoneNumber = PhoneNumber.dirty(value: event.phoneNumber);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(
          [phoneNumber, state.password],
        ),
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(value: event.password);
    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([
          // state.email,
          password,
        ]),
      ),
    );
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(
        state.copyWith(
          status: FormzStatus.submissionInProgress,
          loginProgress: LoginProgress.loginInProgress,
        ),
      );
      try {
        if (state.phoneNumber.valid) {
          // final isAuth = await _authenticationRepository.logInWithEmail(
          //   email: state.email.value,
          //   password: state.password.value,
          // );
          final isAuth = await _authenticationRepository.loginWithPhoneNumber(
              phoneNumber: "");
          if (isAuth) {
            // await Future.delayed(const Duration(milliseconds: 500));
            emit(state.copyWith(
              status: FormzStatus.submissionSuccess,
              loginProgress: LoginProgress.loginSuccess,
            ));
          } else {
            emit(state.copyWith(
              status: FormzStatus.submissionFailure,
              loginProgress: LoginProgress.loginFailure,
            ));
          }
        }
      } catch (e) {
        FirebaseLogger().log('login_bloc', "submitted_login: ${e.toString()}");
        emit(state.copyWith(
          loginProgress: LoginProgress.loginFailure,
          status: FormzStatus.submissionFailure,
        ));
      }
      // Save login info
      final prefs = await SharedPreferences.getInstance();
      RememberMeModel rememberMeModel = RememberMeModel.empty;
      if (state.isRememberMe) {
        rememberMeModel = rememberMeModel.copyWith(
          isRemember: state.isRememberMe,
          // email: state.email.value,
          password: state.password.value,
        );
      }

      prefs.setString(
        Constant.rememberMeInfoLogin,
        json.encode(
          rememberMeModel.toJson(),
        ),
      );
    }
  }

  void _onRememberMeChanged(
    LoginRememberMeChanged event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isRememberMe: event.isRemember));
  }

  Future<void> _onForgotPassword(
    LoginForgotPassword event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(loginProgress: LoginProgress.forgotPasswordInProgress));
    bool isValidEmail = Formz.validate([
      // state.email,
    ]).isValidated;
    if (isValidEmail) {
      // await _authenticationRepository.forgotPasswordRequest(
      // state.email.value,
      // );
      emit(state.copyWith(loginProgress: LoginProgress.unknown));
    }
  }

  Future<void> _onLoginWithGoogleAccount(
    LoginWithGoogleAccount event,
    Emitter<LoginState> emit,
  ) async {
    try {
      // await _authenticationRepository.loginWithGoogleAccount();
    } catch (e) {
      FirebaseLogger()
          .log('login_bloc', 'login_with_google_account: error: $e');
    }
  }
}
