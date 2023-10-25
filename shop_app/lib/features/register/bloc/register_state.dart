part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Username username;
  final PhoneNumber phoneNumber;
  final Password password;

  RegisterState copyWith({
    FormzStatus? status,
    Username? username,
    PhoneNumber? phoneNumber,
    Password? password,
  }) {
    return RegisterState(
      status: status ?? this.status,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [
        status,
        username,
        phoneNumber,
        password,
      ];
}
