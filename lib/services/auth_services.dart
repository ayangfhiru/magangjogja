part of 'services.dart';

class AuthServices extends ChangeNotifier {
  final storage = const FlutterSecureStorage();

  Future login({required Map creds}) async {
    var url = Uri.parse('$baseUrl/login');
    var response = await http.post(url, body: creds);
    if (response.statusCode == 200) {
      String tokenCandidate = json.decode(response.body)['data'];
      return tokenCandidate;
    }
  }

  Future register({required Map creds}) async {
    var url = Uri.parse('$baseUrl/register');
    var response = await http.post(url, body: creds);
    if (response.statusCode == 200) {
      String tokenCandidate = json.decode(response.body)['data'];
      debugPrint(tokenCandidate);
      emailVerification(token: tokenCandidate);
    }
  }

  Future<UserModel?> tryToken({required String token}) async {
    if (token.isEmpty) {
      return null;
    } else {
      try {
        var url = Uri.parse('$baseUrl/user');
        var response =
            await http.get(url, headers: {'Authorization': 'Bearer $token'});

        Map<String, dynamic> data = json.decode(response.body)['data'];
        var userModel = UserModel.fromJson(data);
        storeToken(token: token);
        return userModel;
      } catch (e) {
        throw "$e";
      }
    }
  }

  Future storeToken({required String token}) async {
    await storage.write(key: 'token', value: token);
  }

  Future checkToken() async {
    var res = storage.read(key: 'token');
    return res;
  }

  Future deleteToken() async {
    final tokenNow = await storage.read(key: 'token');
    try {
      await dio().get('/user/revoke',
          options:
              http_dio.Options(headers: {'Authorization': 'Bearer $tokenNow'}));
      storage.delete(key: 'token');
      storage.deleteAll();
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future emailVerification({required token}) async {
    try {
      var url = Uri.parse('$baseUrl/email/verification-notification');
      var response =
          await http.post(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) debugPrint('verification link send');
    } catch (e) {
      return e;
    }
  }
}
