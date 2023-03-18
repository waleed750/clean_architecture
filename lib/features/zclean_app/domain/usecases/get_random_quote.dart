import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/zclean_app/domain/entities/quote.dart';
import 'package:clean_architecture/features/zclean_app/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomQuoteUseCase extends UseCase<Quote , NoParams> {
  final QuoteRepository quoteRepository ;

  GetRandomQuoteUseCase({required this.quoteRepository });

  @override
  Future<Either<Failure, Quote>> call(NoParams prams) => quoteRepository.getRandomQuote() ;

}