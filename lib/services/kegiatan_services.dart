part of 'services.dart';

class KegiatanServices {
  final storage = const FlutterSecureStorage();
  late String? token;
  // user
  Future addCatatan({required Map data}) async {
    try {
      token = await storage.read(key: 'token');
      var url = Uri.parse('$baseUrl/add-catatan');
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $token'}, body: data);
      if (response.statusCode == 200) {
        return "success";
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  // guru
  Future<List<KegiatanGuruModel>> getListCatatan() async {
    token = await storage.read(key: 'token');
    var url = Uri.parse('$baseUrl/list-catatan');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      final body = json.decode(response.body)['data'] as List;
      return body
          .map<KegiatanGuruModel>((e) => KegiatanGuruModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load databases');
    }
  }

  Future<List<DetailKegiatanGuruModel>> getDetailCatatanById(
      {required int id}) async {
    token = await storage.read(key: 'token');
    var url = Uri.parse('$baseUrl/get-detail-catatan-id?id=$id');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body)['data'] as List;
      var data = body.map((e) => DetailKegiatanGuruModel.fromJson(e)).toList();
      return data;
    } else {
      throw Exception('Failed to load databases');
    }
  }

  Future<UserForKegiatanModel?> getUserForKegiatan() async {
    try {
      token = await storage.read(key: 'token');
      var url = Uri.parse('$baseUrl/user-kegiatan');
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      debugPrint(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            (json.decode(response.body))['data'] as Map<String, dynamic>;

        return UserForKegiatanModel.fromJson(data);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }
}
