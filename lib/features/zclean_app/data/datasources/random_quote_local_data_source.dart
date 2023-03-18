import 'dart:convert';

import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/quote_model.dart';

abstract class RandomQuoteLocalDataSource{
  Future<QuoteModel> getLastRandomQuote();
  Future<void> cacheQuote(QuoteModel quote);
}
class RandomQuoteLocalDataSourceImpl extends RandomQuoteLocalDataSource{
  final SharedPreferences sharedPreferences;

  RandomQuoteLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheQuote(QuoteModel quote) async {
    await sharedPreferences.setString( AppStrings.cachedRandomQuote,
        json.encode(quote));
  }

  @override
  Future<QuoteModel> getLastRandomQuote()async {
    final jsonString =
    sharedPreferences.getString(AppStrings.cachedRandomQuote);
    if (jsonString != null) {
      final cacheRandomQuote =
      Future.value(QuoteModel.fromJson(json.decode(jsonString)));
      return cacheRandomQuote;
    } else {
      throw CacheException();
    }
  }

}