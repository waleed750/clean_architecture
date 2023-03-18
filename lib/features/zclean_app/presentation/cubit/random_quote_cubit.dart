import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/errors/failure.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/zclean_app/data/models/quote_model.dart';
import 'package:clean_architecture/features/zclean_app/domain/entities/quote.dart';
import 'package:clean_architecture/features/zclean_app/domain/usecases/get_random_quote.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_strings.dart';

part 'random_quote_state.dart';

class RandomQuoteCubit extends Cubit<RandomQuoteState> {
  final GetRandomQuoteUseCase getRandomQuoteUseCase;

  RandomQuoteCubit({required this.getRandomQuoteUseCase}) : super(RandomQuoteInitial());
  static RandomQuoteCubit get(BuildContext context) => BlocProvider.of<RandomQuoteCubit>(context);

  Future<void> getRandomQuote() async{
      emit(RandomIsLoadingState());
      var response = await getRandomQuoteUseCase(NoParams());
      emit(response.fold(
              (l) => RandomQuoteErrorState(error: _mapFailuremessage(l)),
              (r) => RandomQuoteLoadedState(r)));

  }

  String _mapFailuremessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return AppStrings.serverFailureMsg;
      case CacheFailure :
        return AppStrings.cacheFailureMsg;
      default :
        return AppStrings.unexpectedError;
    }
  }
}
