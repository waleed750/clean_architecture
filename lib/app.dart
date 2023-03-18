import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/config/themes/themes.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/splash/splash_screen/presentation/cubit/locale_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture/injection_container.dart' as di;

import 'config/localization/app_localizations_setup.dart';
class CleanApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => di.sl<LocaleCubit>() ),
    ],
        child: BlocBuilder<LocaleCubit , LocaleState>(
          buildWhen: ((previous, current) {
            return previous != current;
          }),
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.appTitle,
            locale: state.locale,
            theme: appTheme(),
            initialRoute: Routes.initialRoute,
            onGenerateRoute: AppRoutes.onGenerateRoute ,
            supportedLocales: AppLocalizationsSetup.supportedLocales,
            localeResolutionCallback:
            AppLocalizationsSetup.localeResolutionCallback,
            localizationsDelegates:
            AppLocalizationsSetup.localizationsDelegates,
          )),
        );
  }
}