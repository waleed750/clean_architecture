part of 'random_quote_cubit.dart';

@immutable
abstract class RandomQuoteState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RandomQuoteInitial extends RandomQuoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RandomIsLoadingState extends RandomQuoteState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RandomQuoteLoadedState extends RandomQuoteState {
  Quote quote;

  RandomQuoteLoadedState(this.quote);

  @override
  List<Object?> get props => [quote];
}


class RandomQuoteErrorState extends RandomQuoteState {
  String error;

  RandomQuoteErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}


