

import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture/core/api/dio_consumer.dart';
import 'package:clean_architecture/core/api/end_points.dart';
import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/quote_model.dart';

abstract class RandomQuoteRemoteDataSource {
  Future<QuoteModel> getRandomQuote() ;
}
class RandomQuoteRemoteDataSourceImpl extends RandomQuoteRemoteDataSource {

  DioConsumer client;

  RandomQuoteRemoteDataSourceImpl({required this.client});

  @override
  Future<QuoteModel> getRandomQuote() async {
    final response = await client.get(EndPoints.random );
    debugPrint('Response : ${response}');
    /*if(response == null){
      throw ServerException();
    }*/
    return QuoteModel.fromJson(_handleResponseAsJson(response)) ;

    /*if(response.statusCode == 200 ){
      return QuoteModel.fromJson(json.decode(response.body));
    }else {
      throw ServerException();
    }*/
  }
  dynamic _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    return responseJson;
  }
}