import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/splash/splash_screen/domain/repositories/lang_repo.dart';
import 'package:dartz/dartz.dart';

class GetLangUseCase extends UseCase<String , NoParams>{
  final LangRepository langRepository;

  GetLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, String>> call(NoParams prams) {
    return langRepository.GetLang();
  }
  
}