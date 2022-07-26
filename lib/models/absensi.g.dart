// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absensi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AbsensiModel _$AbsensiModelFromJson(Map<String, dynamic> json) => AbsensiModel(
      lokasi: json['lokasi'] as String?,
      tanggal: json['tanggal'] as String?,
      masuk: json['masuk'] as int?,
      istirahatKeluar: json['istirahatKeluar'] as int?,
      istirahatMasuk: json['istirahatMasuk'] as int?,
      izinKeluar: json['izinKeluar'] as int?,
      izinMasuk: json['izinMasuk'] as int?,
      pulang: json['pulang'] as int?,
    );

Map<String, dynamic> _$AbsensiModelToJson(AbsensiModel instance) =>
    <String, dynamic>{
      'lokasi': instance.lokasi,
      'tanggal': instance.tanggal,
      'masuk': instance.masuk,
      'istirahatKeluar': instance.istirahatKeluar,
      'istirahatMasuk': instance.istirahatMasuk,
      'izinKeluar': instance.izinKeluar,
      'izinMasuk': instance.izinMasuk,
      'pulang': instance.pulang,
    };

GuruAbsensiModel _$GuruAbsensiModelFromJson(Map<String, dynamic> json) =>
    GuruAbsensiModel(
      namaLengkap: json['namaLengkap'] as String?,
      id: json['id'] as int?,
      user_id: json['user_id'] as int?,
      lokasi: json['lokasi'] as String?,
      tanggal: json['tanggal'] as String?,
      masuk: json['masuk'] as int?,
      istirahatKeluar: json['istirahatKeluar'] as int?,
      istirahatMasuk: json['istirahatMasuk'] as int?,
      izinKeluar: json['izinKeluar'] as int?,
      izinMasuk: json['izinMasuk'] as int?,
      pulang: json['pulang'] as int?,
    );

Map<String, dynamic> _$GuruAbsensiModelToJson(GuruAbsensiModel instance) =>
    <String, dynamic>{
      'namaLengkap': instance.namaLengkap,
      'id': instance.id,
      'user_id': instance.user_id,
      'lokasi': instance.lokasi,
      'tanggal': instance.tanggal,
      'masuk': instance.masuk,
      'istirahatKeluar': instance.istirahatKeluar,
      'istirahatMasuk': instance.istirahatMasuk,
      'izinKeluar': instance.izinKeluar,
      'izinMasuk': instance.izinMasuk,
      'pulang': instance.pulang,
    };

ListAbsensiModel _$ListAbsensiModelFromJson(Map<String, dynamic> json) =>
    ListAbsensiModel(
      id: json['id'] as int,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      namaLengkap: json['namaLengkap'] as String,
    );

Map<String, dynamic> _$ListAbsensiModelToJson(ListAbsensiModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'avatar': instance.avatar,
      'namaLengkap': instance.namaLengkap,
    };
