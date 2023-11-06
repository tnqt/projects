import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'remember_me_model.g.dart';

@JsonSerializable()
class RememberMeModel extends Equatable {
  const RememberMeModel({
    this.isRemember = false,
    this.phoneNumber = '',
    this.password = '',
  });

  final bool isRemember;
  final String phoneNumber;
  final String password;

  static const empty = RememberMeModel(
    isRemember: false,
    phoneNumber: '',
    password: '',
  );

  RememberMeModel copyWith({
    bool? isRemember,
    String? phoneNumber,
    String? password,
  }) {
    return RememberMeModel(
      isRemember: isRemember ?? this.isRemember,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
    );
  }

  factory RememberMeModel.fromJson(Map<String, dynamic> json) =>
      _$RememberMeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RememberMeModelToJson(this);
  
  @override
  List<Object?> get props => [
    isRemember,
    phoneNumber,
    password
  ];
}
