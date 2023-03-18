import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
class AppInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[AppStrings.contentType] =AppStrings.applicationJson ;
    if (kDebugMode) {
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    }
    super.onResponse(response, handler);
  }
   @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
     if (kDebugMode) {
       print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
     }
    super.onError(err, handler);
  }

}