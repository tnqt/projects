part of 'login_bloc.dart';

enum LoginMethod {
  email,
  googleAccount,
}

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class LoginPhoneNumberChanged extends LoginEvent {
  const LoginPhoneNumberChanged(this.phoneNumber);
  
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}

class LoginRememberMeChanged extends LoginEvent {
  const LoginRememberMeChanged(this.isRemember);

  final bool isRemember;

  @override
  List<Object> get props => [isRemember];
}

class LoginForgotPassword extends LoginEvent {
  const LoginForgotPassword();
}

class LoginWithGoogleAccount extends LoginEvent {
  const LoginWithGoogleAccount();
}