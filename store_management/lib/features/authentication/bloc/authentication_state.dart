part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = UserModel.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(UserModel user, AuthenticationStatus status,)
      : this._(status: status, user: user);

  const AuthenticationState.unauthenticated(AuthenticationStatus status,)
      : this._(status: status);

  final AuthenticationStatus status;
  final UserModel user;

  @override
  List<Object> get props => [status, user];
}