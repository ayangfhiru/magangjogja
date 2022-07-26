// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kegiatan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KegiatanGuruModel _$KegiatanGuruModelFromJson(Map<String, dynamic> json) =>
    KegiatanGuruModel(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      tanggal: json['tanggal'] as int,
      catatan: json['catatan'] as String,
      namaLengkap: json['namaLengkap'] as String,
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$KegiatanGuruModelToJson(KegiatanGuruModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'tanggal': instance.tanggal,
      'catatan': instance.catatan,
      'namaLengkap': instance.namaLengkap,
      'avatar': instance.avatar,
    };

DetailKegiatanGuruModel _$DetailKegiatanGuruModelFromJson(
        Map<String, dynamic> json) =>
    DetailKegiatanGuruModel(
      id: json['id'] as int,
      user_id: json['user_id'] as int,
      tanggal: json['tanggal'] as int,
      catatan: json['catatan'] as String,
      namaLengkap: json['namaLengkap'] as String,
    );

Map<String, dynamic> _$DetailKegiatanGuruModelToJson(
        DetailKegiatanGuruModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.user_id,
      'tanggal': instance.tanggal,
      'catatan': instance.catatan,
      'namaLengkap': instance.namaLengkap,
    };
