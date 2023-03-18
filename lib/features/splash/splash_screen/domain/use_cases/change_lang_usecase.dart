import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/splash/splash_screen/domain/repositories/lang_repo.dart';
import 'package:dartz/dartz.dart';

class ChangeLangUseCase extends UseCase<bool , String> {
  LangRepository langRepository;

  ChangeLangUseCase({required this.langRepository});

  @override
  Future<Either<Failure, bool>> call(String lang) {
    return langRepository.changeLang(lang);
  }

}