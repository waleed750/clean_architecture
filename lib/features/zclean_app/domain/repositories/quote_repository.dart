import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/features/zclean_app/domain/entities/quote.dart';
import 'package:dartz/dartz.dart';

abstract class QuoteRepository {
  Future<Either<Failure , Quote>> getRandomQuote();
  Future<Either<Failure, Quote >> getSpecificAuthor(String authors);
}