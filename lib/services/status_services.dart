part of 'services.dart';

class StatusServices {
  final storage = const FlutterSecureStorage();
  late String? token;

  Future<UserForStatus?> getUserForStatus() async {
    try {
      token = await storage.read(key: 'token');
      var url = Uri.parse('$baseUrl/user-status');
      var response =
          await http.get(url, headers: {'Authorization': 'Bearer $token'});
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            (json.decode(response.body))['data'] as Map<String, dynamic>;

        return UserForStatus.fromJson(data);
      }
    } catch (e) {
      debugPrint("$e");
    }
    return null;
  }
}
