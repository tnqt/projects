// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remember_me_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RememberMeModel _$RememberMeModelFromJson(Map<String, dynamic> json) {
  return RememberMeModel(
    isRemember: json['isRemember'] as bool,
    phoneNumber: json['phoneNumber'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$RememberMeModelToJson(RememberMeModel instance) =>
    <String, dynamic>{
      'isRemember': instance.isRemember,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
