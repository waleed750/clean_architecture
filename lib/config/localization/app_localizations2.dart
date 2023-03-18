import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' show json;



class AppLocalizations2 {

  final Locale locale;
  AppLocalizations2(this.locale);
  late Map<String,String> _localizedStrings;

  Future<void> load() async{
    //Load the language file from 
    final jsonString  = await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String , String>  jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map<String,String>((key, value) {
        return MapEntry(key, value.toString());      
    });

  }

  String? translate (String key) =>  _localizedStrings[key];
  
  bool get isEnLocale => locale.languageCode == 'en';
}