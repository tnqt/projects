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
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.isRememberMe = false,
    this.loginProgress = LoginProgress.unknown,
  });

  final FormzStatus status;
  final Username username;
  final Password password;
  final bool isRememberMe;
  final LoginProgress loginProgress;

  LoginState copyWith({
    FormzStatus? status,
    Username? username,
    Password? password,
    bool? isRememberMe,
    LoginProgress? loginProgress,
  }) {
    return LoginState(
      status: status ?? this.status,
      username: username ?? this.username,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      loginProgress: loginProgress ?? this.loginProgress,
    );
  }

  @override
  List<Object> get props => [status, password, username, isRememberMe, loginProgress];
}
