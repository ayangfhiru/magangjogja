// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'detail_user.g.dart';

@JsonSerializable()
class DetailUserModel {
  final int user_id;
  final String namaLengkap;
  final String nik;
  final String jenisKelamin;
  final String nomorWhatsapp;
  final String asalSekolah;
  final String programStudi;
  final String kotaAsal;
  final String alasanMagang;
  final String jenisMagang;
  final String sistemMagang;
  final String statusAnda;
  final String bukuInggris;
  final String whatsappDosen;
  final String programMagang;
  final String jamKerja;
  final String yangDikuasai;
  final String laptop;
  final String memilikiAlat;
  final String mulaiMagang;
  final String infoMagang;
  final String motor;
  final String curriculumvitae;
  final String portofolio;

  DetailUserModel({
    required this.user_id,
    required this.namaLengkap,
    required this.nik,
    required this.jenisKelamin,
    required this.nomorWhatsapp,
    required this.asalSekolah,
    required this.programStudi,
    required this.kotaAsal,
    required this.alasanMagang,
    required this.jenisMagang,
    required this.sistemMagang,
    required this.statusAnda,
    required this.bukuInggris,
    required this.whatsappDosen,
    required this.programMagang,
    required this.jamKerja,
    required this.yangDikuasai,
    required this.laptop,
    required this.memilikiAlat,
    required this.mulaiMagang,
    required this.infoMagang,
    required this.motor,
    required this.curriculumvitae,
    required this.portofolio,
  });

  factory DetailUserModel.fromJson(Map<String, dynamic> json) =>
      _$DetailUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$DetailUserModelToJson(this);
}
