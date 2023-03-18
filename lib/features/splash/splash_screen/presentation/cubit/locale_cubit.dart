import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/change_lang_usecase.dart';
import '../../domain/use_cases/get_lang_usecase.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  final GetLangUseCase getSavedLangUseCase;
  final ChangeLangUseCase changeLangUseCase;
  LocaleCubit(
      {required this.getSavedLangUseCase, required this.changeLangUseCase})
      : super(const changeLocaleState(Locale(AppStrings.englishCode)));

  var currentLang = AppStrings.englishCode;

  Future<void> getCurrentLanguage()async{
    final response = await getSavedLangUseCase(NoParams());
    response.fold((failure) => debugPrint(AppStrings.cacheFailureMsg) ,
        (value){
          currentLang = value;
          emit(changeLocaleState(Locale(currentLang)));
        }
    );
  }
  Future<void> changeLanguage(String langCode) async{
    final response =await changeLangUseCase(langCode);
    response.fold((failure) => debugPrint(AppStrings.cacheFailureMsg) ,
            (value){
          currentLang = langCode;
          emit(changeLocaleState(Locale(currentLang)));
        }
    );
  }
  void changeLanguageToArabic () => changeLanguage(AppStrings.arabicCode);

  void changeLanguageToEnglish () => changeLanguage(AppStrings.englishCode);
}
