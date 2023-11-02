import 'package:formz/formz.dart';

enum OtpValidationError { empty }

class Otp extends FormzInput<String, OtpValidationError> {
  const Otp.pure() : super.pure('');
  Otp.dirty({String value = ''}) : super.dirty(value);

  @override
  OtpValidationError? validator(String value) {
    return value.isNotEmpty == true ? null : OtpValidationError.empty;
  }
}
