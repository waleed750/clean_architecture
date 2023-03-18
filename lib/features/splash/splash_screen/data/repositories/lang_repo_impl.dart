import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/splash/splash_screen/data/data_sources/lang_local_data_source.dart';
import 'package:clean_architecture/features/splash/splash_screen/domain/repositories/lang_repo.dart';
import 'package:dartz/dartz.dart';

class LangRepositoryImpl extends LangRepository{
  final LangLocalDataSource langLocalDataSource;

  LangRepositoryImpl({required this.langLocalDataSource});

  @override
  Future<Either<Failure, String>> GetLang()async {
    try{
      final response = await langLocalDataSource.getSavedLanguageCode();
      return Right(response);
    }on CacheException{
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> changeLang(String lang) async{
    try{
      final response = await langLocalDataSource.changeLanguageCode(langCode: lang);
      return Right(response);
    }on CacheException{
      return Left(CacheFailure());
    }
  }

}