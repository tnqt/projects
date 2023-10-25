import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shop_app/shop_app.dart';

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
    on<RegisterSubmitted>(_onSubmitted);
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
        status: Formz.validate(
            [state.password, username, state.phoneNumber]),
      ),
    );
  }

  void _onPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) {
    final phoneNumber = PhoneNumber.dirty(value: event.phone);
    emit(state.copyWith(
        phoneNumber: phoneNumber,
        status: Formz.validate(
            [state.username, phoneNumber, state.password])));
  }

  void _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) {
    final password = Password.dirty(value: event.password);

    emit(
      state.copyWith(
        password: password,
        status: Formz.validate(
            [state.username, state.phoneNumber, password]),
      ),
    );
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        // await _authenticationRepository.mailRegisterRequest(
        //     state.email.value, state.password.value);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (e) {
        FirebaseLogger().log('register_bloc',"submitted_register: ${e.toString()}");
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
