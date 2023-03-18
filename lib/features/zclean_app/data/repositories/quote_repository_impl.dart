import 'package:clean_architecture/core/errors/exceptions.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/network/network_info.dart';
import 'package:clean_architecture/features/zclean_app/data/datasources/random_quote_local_data_source.dart';
import 'package:clean_architecture/features/zclean_app/domain/entities/quote.dart';
import 'package:clean_architecture/features/zclean_app/domain/repositories/quote_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasources/random_quote_remote_data_source.dart';

class QuoteRespositoryImpl extends QuoteRepository{
  final NetworkInfo networkInfo ;
  final RandomQuoteRemoteDataSource randomQuoteRemoteDataSource ;
  final RandomQuoteLocalDataSource randomQuoteLocalDataSource;

  QuoteRespositoryImpl({required this.networkInfo,
    required this.randomQuoteRemoteDataSource,
    required this.randomQuoteLocalDataSource});

  @override
  Future<Either<Failure, Quote>> getRandomQuote()async {
    if(await networkInfo.isConnected()){
      try {
        var quote = await randomQuoteRemoteDataSource.getRandomQuote();
        /*if(quote == null){
          throw ServerException();
        }*/
        randomQuoteLocalDataSource.cacheQuote(quote);
        return Right(quote);
      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
     try {
       var quote = await randomQuoteLocalDataSource.getLastRandomQuote();
       return Right(quote);
     }on CacheException{
       return Left(CacheFailure());
     }
    }
  }

  @override
  Future<Either<Failure, Quote>> getSpecificAuthor(String authors) {
    // TODO: implement getSpecificAuthor
    throw UnimplementedError();
  }

}