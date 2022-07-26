// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'absensi.g.dart';

@JsonSerializable()
class AbsensiModel {
  final String? lokasi;
  final String? tanggal;
  final int? masuk;
  final int? istirahatKeluar;
  final int? istirahatMasuk;
  final int? izinKeluar;
  final int? izinMasuk;
  final int? pulang;

  AbsensiModel(
      {this.lokasi,
      this.tanggal,
      this.masuk,
      this.istirahatKeluar,
      this.istirahatMasuk,
      this.izinKeluar,
      this.izinMasuk,
      this.pulang});

  factory AbsensiModel.fromJson(Map<String, dynamic> json) =>
      _$AbsensiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AbsensiModelToJson(this);
}

@JsonSerializable()
class GuruAbsensiModel {
  final String? namaLengkap;
  final int? id;
  final int? user_id;
  final String? lokasi;
  final String? tanggal;
  final int? masuk;
  final int? istirahatKeluar;
  final int? istirahatMasuk;
  final int? izinKeluar;
  final int? izinMasuk;
  final int? pulang;

  GuruAbsensiModel(
      {this.namaLengkap,
      this.id,
      this.user_id,
      this.lokasi,
      this.tanggal,
      this.masuk,
      this.istirahatKeluar,
      this.istirahatMasuk,
      this.izinKeluar,
      this.izinMasuk,
      this.pulang});

  factory GuruAbsensiModel.fromJson(Map<String, dynamic> json) {
    return _$GuruAbsensiModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GuruAbsensiModelToJson(this);
}

@JsonSerializable()
class ListAbsensiModel {
  final int id;
  final String email;
  final String? avatar;
  final String namaLengkap;

  ListAbsensiModel({
    required this.id,
    required this.email,
    this.avatar,
    required this.namaLengkap,
  });

  factory ListAbsensiModel.fromJson(Map<String, dynamic> json) {
    return _$ListAbsensiModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ListAbsensiModelToJson(this);
}
