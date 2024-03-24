import 'package:dio/dio.dart';

import 'end_points.dart';

class DioHelper {
  static Dio dio = Dio();
  static String baseUrl = 'https://581f-41-235-195-86.ngrok-free.app/api/v1/';

  static void init() {
    dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          receiveDataWhenStatusError: true,
          followRedirects: false,
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          connectTimeout: const Duration(seconds: 10),
          sendTimeout: const Duration(seconds: 3),
          receiveTimeout: const Duration(seconds: 10)),
    );
  }

  static Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? data,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${EndPoint.userToken}"
    };
    return await dio.post(endPoint, data: data);
  }

  static Future<Response> getData(
      {required String endPoint,
      String? token,
      Map<String, dynamic>? header}) async {
    dio.options.headers = header ??
        {
          'Content-Type': 'application/json',
          // 'Authorization': "Bearer ${EndPoint.userToken}",
        };
    return await dio.get(endPoint);
  }

  static Future<Response> putData(
      {required String endPoint,
      Map<String, dynamic>? data,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': "application/json",
      'Authorization': "Bearer ${EndPoint.userToken}"
    };
    return await dio.put(endPoint, data: data);
  }
}
