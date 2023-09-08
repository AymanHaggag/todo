import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://jsonplaceholder.typicode.com/',
        receiveDataWhenStatusError: true,
        // headers: {
        //   'Content-Type': 'application/json',
        // },
      ),
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = "ar",
    String? token ,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      "Authorization": token,
    };
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }


  static Future<Response> getData({
    required String url,

  }) async
  {
    dio.options.headers =
    {

    };

    return await dio.get(
      url,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = "ar",
    String? token ,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Content-Type': 'application/json',
      "Authorization": token,
    };
    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }


}
