// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioService {
  Dio dio = Dio();
  Future<dynamic> getMethod(String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .get(url,
            options: Options(responseType: ResponseType.json, method: 'GET'))
        .then(
      (response) {
        // log(response.toString());
        return response;
      },
      // ignore: body_might_complete_normally_catch_error
    ).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }

  Future<dynamic> postMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers['content-Type'] = 'application/json';
    return await dio
        .post(url,
            data: dio_service.FormData.fromMap(map),
            options: Options(
              responseType: ResponseType.json,
              method: 'POST',
            ))
        .then((value) {
      // log(value.headers.toString());
      // log(value.data.toString());
      // log(value.statusCode.toString());
      return value;
      // ignore: body_might_complete_normally_catch_error
    }).catchError((err) {
      if (err is DioException) {
        return err.response!;
      }
    });
  }
}
