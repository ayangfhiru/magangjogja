// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'kegiatan.g.dart';

@JsonSerializable()
class KegiatanGuruModel {
  final int id;
  final int user_id;
  final int tanggal;
  final String catatan;
  final String namaLengkap;
  final String avatar;

  KegiatanGuruModel(
      {required this.id,
      required this.user_id,
      required this.tanggal,
      required this.catatan,
      required this.namaLengkap,
      required this.avatar});

  factory KegiatanGuruModel.fromJson(Map<String, dynamic> json) {
    return _$KegiatanGuruModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$KegiatanGuruModelToJson(this);
}

@JsonSerializable()
class DetailKegiatanGuruModel {
  final int id;
  final int user_id;
  final int tanggal;
  final String catatan;
  final String namaLengkap;

  DetailKegiatanGuruModel(
      {required this.id,
      required this.user_id,
      required this.tanggal,
      required this.catatan,
      required this.namaLengkap});

  factory DetailKegiatanGuruModel.fromJson(Map<String, dynamic> json) {
    return _$DetailKegiatanGuruModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DetailKegiatanGuruModelToJson(this);
}
