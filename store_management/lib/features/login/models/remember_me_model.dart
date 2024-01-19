import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'remember_me_model.g.dart';

@JsonSerializable()
class RememberMeModel extends Equatable {
  const RememberMeModel({
    this.isRemember = false,
    this.email = '',
    this.password = '',
  });

  final bool isRemember;
  final String email;
  final String password;

  static const empty = RememberMeModel(
    isRemember: false,
    email: '',
    password: '',
  );

  RememberMeModel copyWith({
    bool? isRemember,
    String? email,
    String? password,
  }) {
    return RememberMeModel(
      isRemember: isRemember ?? this.isRemember,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory RememberMeModel.fromJson(Map<String, dynamic> json) =>
      _$RememberMeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RememberMeModelToJson(this);
  
  @override
  List<Object?> get props => [
    isRemember,
    email,
    password
  ];
}
