

import 'package:clean_architecture/core/api/app_interceptors.dart';
import 'package:clean_architecture/core/api/dio_consumer.dart';
import 'package:clean_architecture/core/network/network_info.dart';
import 'package:clean_architecture/features/splash/splash_screen/data/data_sources/lang_local_data_source.dart';
import 'package:clean_architecture/features/splash/splash_screen/data/repositories/lang_repo_impl.dart';
import 'package:clean_architecture/features/splash/splash_screen/domain/repositories/lang_repo.dart';
import 'package:clean_architecture/features/splash/splash_screen/domain/use_cases/change_lang_usecase.dart';
import 'package:clean_architecture/features/splash/splash_screen/domain/use_cases/get_lang_usecase.dart';
import 'package:clean_architecture/features/splash/splash_screen/presentation/cubit/locale_cubit.dart';
import 'package:clean_architecture/features/zclean_app/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_architecture/features/zclean_app/data/datasources/random_quote_remote_data_source.dart';
import 'package:clean_architecture/features/zclean_app/data/repositories/quote_repository_impl.dart';
import 'package:clean_architecture/features/zclean_app/domain/repositories/quote_repository.dart';
import 'package:clean_architecture/features/zclean_app/domain/usecases/get_random_quote.dart';
import 'package:clean_architecture/features/zclean_app/presentation/cubit/random_quote_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
final sl = GetIt.instance;

Future<void> init() async {
  //! Features
  //Bloc
  sl.registerLazySingleton<RandomQuoteCubit>(() =>
  RandomQuoteCubit(getRandomQuoteUseCase: sl())
  );
  sl.registerLazySingleton<LocaleCubit>(()=>
  LocaleCubit(getSavedLangUseCase: sl(),
      changeLangUseCase: sl())..getCurrentLanguage()
  );

  //Usecases
  sl.registerLazySingleton<GetRandomQuoteUseCase>(() => GetRandomQuoteUseCase(quoteRepository: sl()));
  sl.registerLazySingleton<GetLangUseCase>(() => GetLangUseCase(langRepository: sl()));
  sl.registerLazySingleton<ChangeLangUseCase>(() => ChangeLangUseCase(langRepository: sl()));
  //Repositories
  sl.registerLazySingleton<QuoteRepository>(() => QuoteRespositoryImpl(
      networkInfo: sl(),
      randomQuoteRemoteDataSource: sl(),
      randomQuoteLocalDataSource: sl()));
  sl.registerLazySingleton<LangRepository>(() => LangRepositoryImpl(langLocalDataSource: sl()));

  //# Data Sources
  sl.registerLazySingleton<RandomQuoteRemoteDataSource>(() => RandomQuoteRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<RandomQuoteLocalDataSource>(() => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<LangLocalDataSource>(() => LangLocalDataSourceImpl(sharedPreferences: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
  sl.registerLazySingleton<DioConsumer>(() => DioConsumer(client: sl()));

  //! Externals
  final sharedpreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedpreferences);


  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
    requestBody: true ,
    request: true ,
    responseBody: true ,
  ));

  /*sl.registerLazySingleton<http.Client>(() => http.Client());*/

}