part of 'services.dart';

Dio dio() {
  var dio = Dio();

  //ios
  // dio.options.baseUrl = "http://localhost:8000/api";

  //android
  dio.options.baseUrl = "http://10.0.2.2:8000/api/";
  // dio.options.baseUrl = "http://10.113.114.14/api/";

  // dio.options.baseUrl = "http://127.0.0.1:8000/api";
  dio.options.connectTimeout = 5000;
  dio.options.receiveTimeout = 3000;
  dio.options.contentType = Headers.formUrlEncodedContentType;
  dio.options.headers['Authorization'] = 'Bearer ';

  return dio;
}
