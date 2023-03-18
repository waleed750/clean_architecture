import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture/core/api/api_consumer.dart';
import 'package:clean_architecture/core/api/app_interceptors.dart';
import 'package:clean_architecture/core/api/end_points.dart';
import 'package:clean_architecture/core/api/status_code.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:dio/dio.dart';
import 'package:clean_architecture/injection_container.dart' as di;
import 'package:flutter/foundation.dart';
import 'package:clean_architecture/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer{
  final Dio client;

  DioConsumer({required this.client}){

//waleed Ashraf Was here 
    client.options
        ..baseUrl = EndPoints.baseUrl
        ..validateStatus = ((status) => status! < StatusCode.internalServerError)
        ..followRedirects = false
        ..responseType = ResponseType.plain;
    client.interceptors.add(di.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(di.sl<LogInterceptor>());
    }
  }

  @override
  Future get(String path, {Map<String , dynamic>? queryParameters}) async {
    try{
      var response = await client.get(path , queryParameters: queryParameters);

      return response;
      /*_handleResponseAsJson(response);*/
    } on DioError catch (error){
        _handleDioError(error);
    }
  }

  @override
  Future post(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async{
    try{
      var response = await client.post(path  , data: body , queryParameters: queryParameters);
      _handleResponseAsJson(response);
    } on DioError catch (error){
      _handleDioError(error);
    }
  }

  @override
  Future put(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async{
    try{
      var response = await client.put(path  , data: body , queryParameters: queryParameters);
      _handleResponseAsJson(response);
    } on DioError catch (error){
      _handleDioError(error);
    }
  }
  @override
  Future delete(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async{
    try{
      var response = await client.delete(path  , data: body , queryParameters: queryParameters);
      _handleResponseAsJson(response);
    } on DioError catch (error){
      _handleDioError(error);
    }
  }
  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unAuthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();

          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw const NoInternetConnectionException();

      case DioErrorType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioErrorType.connectionError:
        // TODO: Handle this case.
        break;
    }
  }
}