import 'dart:convert';

import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  contentType: 'application/json',
  responseType: ResponseType.plain,
));

abstract class ApiService {
  Future<dynamic> get(
    String endpoint, {
    Map<String, String>? queryParameter,
  }) async {
    try {
      Response response =
          await dio.get(endpoint, queryParameters: queryParameter);

      final rawResponse = jsonDecode(response.toString());
      return rawResponse;
    } on Exception {
      throw (Exception("Connection Failed !"));
    }
  }

  Future<dynamic> post(
    String endpoint, {
    Map<String, String>? queryParameter,
    Map<String, String>? header,
    Map<String, dynamic>? body,
  }) async {
    try {
      Response response = await dio.post(
        endpoint,
        queryParameters: queryParameter,
        data: body,
        options: Options(headers: header),
      );

      final rawResponse = jsonDecode(response.toString());
      return rawResponse;
    } catch (e) {
      // throw (Exception("Connection Failed !"));
    }
  }
}
