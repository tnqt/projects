// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remember_me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RememberMeModel _$RememberMeModelFromJson(Map<String, dynamic> json) {
  return RememberMeModel(
    isRemember: json['isRemember'] as bool,
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RememberMeModelToJson(RememberMeModel instance) =>
    <String, dynamic>{
      'isRemember': instance.isRemember,
      'email': instance.email,
      'password': instance.password,
    };
