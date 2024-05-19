import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class API {
  final Dio _dio = Dio();

  API() {
    _dio.options.baseUrl =
        "https://engineering-backend-git-main-aashish-lamsals-projects.vercel.app";
    _dio.interceptors.add(
      PrettyDioLogger(
        responseBody: false,
      ),
    );
  }
  Dio get sendRequest => _dio;
}
