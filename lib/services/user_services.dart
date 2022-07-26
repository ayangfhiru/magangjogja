part of 'services.dart';

class UserServices {
  final storage = const FlutterSecureStorage();
  late String? token;

  Future<UserModel?> getUser() async {
    try {
      token = await storage.read(key: 'token');
      var url = Uri.parse('$baseUrl/user');
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            (json.decode(response.body))['data'] as Map<String, dynamic>;
        return UserModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }

  Future updateAvatar(File avatar) async {
    try {
      token = await storage.read(key: 'token');

      String name = avatar.path.split('/').last;
      var data = FormData.fromMap({
        "avatar": await MultipartFile.fromFile(
          avatar.path,
          filename: name,
        ),
      });

      http_dio.Response response = await dio().post(
        'update-avatar',
        data: data,
        options: http_dio.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        debugPrint('success');
      }
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<DetailUserModel?> addPendaftaran({required Map creds}) async {
    try {
      token = await storage.read(key: 'token');
      debugPrint(creds.toString());
      http_dio.Response response = await dio().post('/detail-user',
          data: creds,
          options:
              http_dio.Options(headers: {'Authorization': 'Bearer $token'}));
      debugPrint(response.data);
      if (response.statusCode == 200) {
        await UserServices().getDetailUser();
      }
      return null;
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }

  Future uploadCv(File fileCv, String? fileNameCv) async {
    token = await storage.read(key: 'token');
    debugPrint(fileNameCv);
    var dataCv = FormData.fromMap({
      "curriculumvitae": await MultipartFile.fromFile(
        fileCv.path,
        filename: fileNameCv,
      ),
    });

    await dio().post('/upload-cv',
        data: dataCv,
        options: http_dio.Options(headers: {'Authorization': 'Bearer $token'}));
  }

  Future uploadPorto(File filePorto, String? fileNamePortofolio) async {
    token = await storage.read(key: 'token');
    debugPrint(fileNamePortofolio);
    var dataPorto = FormData.fromMap({
      "portofolio": await MultipartFile.fromFile(
        filePorto.path,
        filename: fileNamePortofolio,
      ),
    });
    await dio().post('/upload-porto',
        data: dataPorto,
        options: http_dio.Options(headers: {'Authorization': 'Bearer $token'}));
  }

  Future<List<DetailUserModel>?> getDetailUser() async {
    token = await storage.read(key: 'token');
    var url = Uri.parse('$baseUrl/detail-userid');
    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      var data = (json.decode(response.body))['data'];
      if (data != null) {
        var data = (json.decode(response.body))['data'] as List;
        var res = data.map((e) => DetailUserModel.fromJson(e)).toList();
        return res;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}
