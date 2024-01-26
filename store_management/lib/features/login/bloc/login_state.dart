part of 'login_bloc.dart';

enum LoginProgress {
  unknown,
  forgotPasswordInProgress,
  loginInProgress,
  loginSuccess,
  loginFailure,
}

class LoginState extends Equatable {
  const LoginState({
    this.status = FormzSubmissionStatus.initial,
    this.username = const Username.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isRememberMe = false,
    this.loginProgress = LoginProgress.unknown,
  });

  final FormzSubmissionStatus status;
  final Username username;
  final Email email;
  final Password password;
  final bool isRememberMe;
  final LoginProgress loginProgress;

  LoginState copyWith({
    FormzSubmissionStatus? status,
    Username? username,
    Email? email,
    Password? password,
    bool? isRememberMe,
    LoginProgress? loginProgress,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      loginProgress: loginProgress ?? this.loginProgress,
    );
  }

  @override
  List<Object> get props => [status, email, password, username, isRememberMe, loginProgress];
}
