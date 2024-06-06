import 'package:dio/dio.dart';
import 'dart:developer';

class DioService {
  Future<dynamic> getMethod(String url) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then(
      (response) {
        log(response.toString());
        return response;
      },
    );
  }
}
