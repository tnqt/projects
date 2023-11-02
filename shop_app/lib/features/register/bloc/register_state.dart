part of 'register_bloc.dart';

class RegisterState extends Equatable {
  const RegisterState({
    this.status = FormzStatus.pure,
    this.username = const Username.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.password = const Password.pure(),
    this.otp = const Otp.pure(),
    this.verificationId = "",
  });

  final FormzStatus status;
  final Username username;
  final PhoneNumber phoneNumber;
  final Password password;
  final Otp otp;
  final String verificationId;

  RegisterState copyWith({
    FormzStatus? status,
    Username? username,
    PhoneNumber? phoneNumber,
    Password? password,
    Otp? otp,
    String? verificationId,
  }) {
    return RegisterState(
      status: status ?? this.status,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      otp: otp ?? this.otp,
      verificationId: verificationId ?? this.verificationId,
    );
  }

  @override
  List<Object> get props => [
        status,
        username,
        phoneNumber,
        password,
        otp,
        verificationId,
      ];
}
