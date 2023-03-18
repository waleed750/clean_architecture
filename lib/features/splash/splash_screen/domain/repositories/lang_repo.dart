import 'package:clean_architecture/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class LangRepository{
  Future<Either<Failure , String>> GetLang();
  Future<Either<Failure , bool>> changeLang(String lang);

}