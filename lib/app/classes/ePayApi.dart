import 'package:dio/dio.dart';

class EPayApi {
  static const apiUrl = "https://azerbaijanweb.paygo.az/api/";

  static BaseOptions _baseOptions = new BaseOptions(baseUrl: apiUrl);
  static Dio dio = new Dio(_baseOptions);

  static Dio dioAuth() {
    return Dio();
  }
}
