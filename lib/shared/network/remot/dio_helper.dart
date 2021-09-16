import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  DioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://dummyapi.io/data/v1/',
        receiveDataWhenStatusError: true,
        headers: {'app-id':'613cd6ba73e03de61f25443c'}));
  }

  static Future<Response> getData({required String url}) async {
    return await dio!.get(url);
  }
}
