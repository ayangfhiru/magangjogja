part of 'services.dart';

class AbsensiServices {
  final storage = const FlutterSecureStorage();
  late String? token;

  Future postAbsensi({required time}) async {
    debugPrint('post absensi $time');
    try {
      token = await storage.read(key: 'token');
      http_dio.Response response = await dio().post('/absen',
          data: time,
          options:
              http_dio.Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        return "berhasil";
      } else {
        return "gagal";
      }
    } catch (e) {
      return null;
    }
  }

  Future<AbsensiModel?> getAbsensi() async {
    token = await storage.read(key: 'token');
    var url = Uri.parse('$baseUrl/absen');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = json.decode(response.body)['data'];
      return AbsensiModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future getListAnak() async {
    token = await storage.read(key: 'token');
    var url = Uri.parse('$baseUrl/list-anak');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['data'] as List;
      return body
          .map<ListAbsensiModel>((e) => ListAbsensiModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load databases');
    }
  }
}
