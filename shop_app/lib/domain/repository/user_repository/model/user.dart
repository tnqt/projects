import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.id = 0,
    this.userName = '',
    this.email = '',
    this.phoneNumber = '',
  });

  final int id;
  final String userName;
  final String email;
  final String phoneNumber;

  @override
  List<Object> get props => [id];

  static const empty = UserModel(
    id: 0,
    userName: '',
    email: '',
    phoneNumber: '',
  );
}
