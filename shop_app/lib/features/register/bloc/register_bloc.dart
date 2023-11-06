import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shop_app/shop_app.dart';
import 'package:tuple/tuple.dart';

part 'register_event.dart';

part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const RegisterState()) {
    on<RegisterEmailChanged>(_onRegisterEmailChanged);
    on<RegisterUsernameChanged>(_onUsernameChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterOtpChanged>(_onOtpChanged);
    on<RegisterPhoneSubmitted>(_onPhoneNumberSubmitted);
    on<RegisterOtpSubmitted>(_onOtpSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onRegisterEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) {
    final email = Email.dirty(value: event.email);
    emit(state.copyWith(
        status: Formz.validate([
      email,
      state.username,
      state.phoneNumber,
      state.password,
    ])));
  }

  void _onUsernameChanged(
    RegisterUsernameChanged event,
    Emitter<RegisterState> emit,
  ) {
    final username = Username.dirty(value: event.username);
    emit(
      state.copyWith(
        username: username,
        status: Formz.validate([state.password, username, state.phoneNumber]),
      ),
    );
  }

  void _onPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phoneNumber = PhoneNumber.dirty(value: event.phone);
    FirebaseLogger().log("on_phone_changed", "phoneNumber: $phoneNumber");
    emit(state.copyWith(
        phoneNumber: phoneNumber,
        // status: Formz.validate(
        // [state.username, phoneNumber, state.password])));
        status: Formz.validate([phoneNumber])));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(value: event.password);

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate([state.username, state.phoneNumber, password]),
      ),
    );
  }

  void _onOtpChanged(
    RegisterOtpChanged event,
    Emitter<RegisterState> emit,
  ) {
    final otp = Otp.dirty(value: event.otp);
    FirebaseLogger().log("on_otp_changed", "otp: $otp");
    emit(
      state.copyWith(
        otp: otp,
        status: Formz.validate([state.phoneNumber, otp]),
      ),
    );
  }

  Future<void> _onPhoneNumberSubmitted(
    RegisterPhoneSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        Tuple2<VerificationPhoneNumberCallBack, String> result =
            await _authenticationRepository
                .phoneNumberRegisterRequest(state.phoneNumber.value);
        FirebaseLogger()
            .log('on_phone_number_submitted', "result 1: ${result.item1}");
        if (result.item1 == VerificationPhoneNumberCallBack.codeSent) {
          emit(state.copyWith(
              status: FormzStatus.submissionSuccess,
              verificationId: result.item2));
        } else if (result.item1 ==
            VerificationPhoneNumberCallBack.verificationCompleted) {
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }
      } catch (e) {
        FirebaseLogger()
            .log('register_bloc', "submitted_register: ${e.toString()}");
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }

  Future<bool> _onOtpSubmitted(
    RegisterOtpSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    bool result = false;
    if (state.status.isValidated) {
      FirebaseLogger().log('on_otp_submitted',
          "verificationId: ${state.verificationId} - otp: ${state.otp.value}");
      emit(state.copyWith(
        status: FormzStatus.submissionInProgress,
        registerStatus: RegisterStatus.inProgress,
      ));
      try {
        result = await _authenticationRepository.otpCredentialRequest(
            state.verificationId, state.otp.value);
        if (result) {
          
        }
      } catch (e) {
        FirebaseLogger().log('register_bloc', "error: ${e.toString()}");
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
    return result;
  }
}
