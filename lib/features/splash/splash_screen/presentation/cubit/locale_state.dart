part of 'locale_cubit.dart';

@immutable
abstract class LocaleState {
  final Locale locale ;

   const LocaleState(this.locale);
}

class changeLocaleState extends LocaleState {
  const changeLocaleState(Locale selectedLocale) : super(selectedLocale);
}


