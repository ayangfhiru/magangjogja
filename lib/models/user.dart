// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  final String name;
  final String email;
  final String role;
  final String? avatar;
  final String profile_photo_path;

  const UserModel(
      {required this.name,
      required this.email,
      required this.role,
      required this.avatar,
      required this.profile_photo_path});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable()
class UserForStatus {
  final int id;
  final String? avatar;
  final String namaLengkap;
  final String programMagang;
  final int tglGabung;

  UserForStatus({
    required this.id,
    this.avatar,
    required this.namaLengkap,
    required this.programMagang,
    required this.tglGabung,
  });

  factory UserForStatus.fromJson(Map<String, dynamic> json) =>
      _$UserForStatusFromJson(json);
  Map<String, dynamic> toJson() => _$UserForStatusToJson(this);
}

@JsonSerializable()
class UserForKegiatanModel {
  final int id;
  final String namaLengkap;

  UserForKegiatanModel({
    required this.id,
    required this.namaLengkap,
  });

  factory UserForKegiatanModel.fromJson(Map<String, dynamic> json) {
    return _$UserForKegiatanModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$UserForKegiatanModelToJson(this);
}

// @JsonSerializable()
// class UserJoinDetailUserModel {
//   final int id;
//   final String email;
//   final String role;
//   final String avatar;
//   final String profile_photo_path;
//   final String namaLengkap;
//   final String nik;
//   final String jenisKelamin;
//   final String nomorWhatsapp;
//   final String asalSekolah;
//   final String programStudi;
//   final String kotaAsal;
//   final String alasanMagang;
//   final String jenisMagang;
//   final String sistemMagang;
//   final String statusAnda;
//   final String bukuInggris;
//   final String whatsappDosen;
//   final String programMagang;
//   final String jamKerja;
//   final String yangDikuasai;
//   final String laptop;
//   final String memilikiAlat;
//   final String mulaiMagang;
//   final String infoMagang;
//   final String motor;
//   final int tglGabung;
//   final String curriculumvitae;
//   final String portofolio;

//   UserJoinDetailUserModel({
//     required this.id,
//     required this.email,
//     required this.role,
//     required this.avatar,
//     required this.profile_photo_path,
//     required this.namaLengkap,
//     required this.nik,
//     required this.jenisKelamin,
//     required this.nomorWhatsapp,
//     required this.asalSekolah,
//     required this.programStudi,
//     required this.kotaAsal,
//     required this.alasanMagang,
//     required this.jenisMagang,
//     required this.sistemMagang,
//     required this.statusAnda,
//     required this.bukuInggris,
//     required this.whatsappDosen,
//     required this.programMagang,
//     required this.jamKerja,
//     required this.yangDikuasai,
//     required this.laptop,
//     required this.memilikiAlat,
//     required this.mulaiMagang,
//     required this.infoMagang,
//     required this.motor,
//     required this.tglGabung,
//     required this.curriculumvitae,
//     required this.portofolio,
//   });

//   factory UserJoinDetailUserModel.fromJson(Map<String, dynamic> json) {
//     return _$UserJoinDetailUserModelFromJson(json);
//   }
//   Map<String, dynamic> toJson() => _$UserJoinDetailUserModelToJson(this);
// }
