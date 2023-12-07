import 'dart:async';

import 'package:dio/dio.dart';
import 'package:paypal_api/constants/app_constants.dart';

class DioClient {
  
  static late Dio _dio;
  static FutureOr<Dio> setUp() {
    final options = BaseOptions(
        baseUrl: AppConstants.baseUrl,
        sendTimeout: const Duration(seconds: 30000),
        connectTimeout: const Duration(seconds: 30000),
        receiveTimeout: const Duration(seconds: 30000),
        headers: {"Authorization": "Bearer ${AppConstants.accessToken}"},
        contentType: 'application/json');
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true));
    return _dio;
  }

  static Dio get dio => _dio;
}
