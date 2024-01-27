part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.username = const Username.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.password = const Password.pure(),
  });

  final FormzSubmissionStatus status;
  final Email email;
  final Username username;
  final PhoneNumber phoneNumber;
  final Password password;

  RegisterState copyWith({
    FormzSubmissionStatus? status,
    Email? email,
    Username? username,
    PhoneNumber? phoneNumber,
    Password? password,
  }) {
    return RegisterState(
      status: status ?? this.status,
      email: email ?? this.email,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [status, email, username, phoneNumber, password];
}