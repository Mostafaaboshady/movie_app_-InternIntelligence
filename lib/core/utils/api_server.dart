import 'package:dio/dio.dart';

class ApiServer {
  ApiServer(this.dio);
  final Dio dio;
  Future<Map<String, dynamic>> get({required String api}) async {
    var response = await dio.get(api);

    return response.data;
  }
}
