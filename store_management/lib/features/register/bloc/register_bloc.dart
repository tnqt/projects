import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:shared_module/shared_module.dart';
import 'package:store_management/store_management.dart';

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
    emit(
      state.copyWith(
        email: email,
        status: Formz.validate([
          email,
          state.username,
          state.phoneNumber,
          state.password,
        ])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
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
                [state.email, state.password, username, state.phoneNumber])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
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
              [state.email, state.username, phoneNumber, state.password])
          ? FormzSubmissionStatus.success
          : FormzSubmissionStatus.failure,
    ));
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
                [state.email, state.username, state.phoneNumber, password])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
      ),
    );
  }

  Future<void> _onSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (state.status == FormzSubmissionStatus.success) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        await _authenticationRepository.mailRegisterRequest(
            state.email.value, state.password.value);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        FirebaseLogger()
            .log('register_bloc', "submitted_register: ${e.toString()}");
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
