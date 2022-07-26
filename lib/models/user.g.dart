// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      avatar: json['avatar'] as String?,
      profile_photo_path: json['profile_photo_path'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
      'avatar': instance.avatar,
      'profile_photo_path': instance.profile_photo_path,
    };

UserForStatus _$UserForStatusFromJson(Map<String, dynamic> json) =>
    UserForStatus(
      id: json['id'] as int,
      avatar: json['avatar'] as String?,
      namaLengkap: json['namaLengkap'] as String,
      programMagang: json['programMagang'] as String,
      tglGabung: json['tglGabung'] as int,
    );

Map<String, dynamic> _$UserForStatusToJson(UserForStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'avatar': instance.avatar,
      'namaLengkap': instance.namaLengkap,
      'programMagang': instance.programMagang,
      'tglGabung': instance.tglGabung,
    };

UserForKegiatanModel _$UserForKegiatanModelFromJson(
        Map<String, dynamic> json) =>
    UserForKegiatanModel(
      id: json['id'] as int,
      namaLengkap: json['namaLengkap'] as String,
    );

Map<String, dynamic> _$UserForKegiatanModelToJson(
        UserForKegiatanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'namaLengkap': instance.namaLengkap,
    };
