part of 'register_bloc.dart';

enum RegisterMethod {
  phoneNumber,
  email,
  googleAccount,
}

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailChanged extends RegisterEvent {
  const RegisterEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class RegisterUsernameChanged extends RegisterEvent {
  const RegisterUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

class RegisterPhoneChanged extends RegisterEvent {
  const RegisterPhoneChanged(this.phone);

  final String phone;

  @override
  List<Object> get props => [phone];
}

class RegisterPasswordChanged extends RegisterEvent {
  const RegisterPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class RegisterOtpChanged extends RegisterEvent {
  const RegisterOtpChanged(this.otp);

  final String otp;

  @override
  List<Object> get props => [otp];
}

class RegisterPhoneSubmitted extends RegisterEvent {
  const RegisterPhoneSubmitted();

  @override
  List<Object> get props => [];
}

class RegisterOtpSubmitted extends RegisterEvent {
  const RegisterOtpSubmitted();

  @override
  List<Object> get props => [];
}
