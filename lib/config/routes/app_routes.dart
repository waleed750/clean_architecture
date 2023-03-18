import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/features/favourite/presentation/screen/favourite_screen.dart';
import 'package:clean_architecture/features/splash/splash_screen/presentation/screens/splash.dart';
import 'package:clean_architecture/features/zclean_app/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture/features/zclean_app/presentation/screens/qoute_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection_container.dart' as di;

class Routes{
  static const String initialRoute = '/';
  static const String quoteRoute = '/quoteRoute';
  static const String favouriteRoute = '/favouriteRoute';
}

class AppRoutes {
  static Route? onGenerateRoute (RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.initialRoute :
        return MaterialPageRoute(builder: (context)=> SplashScreen(),
        );
      case Routes.quoteRoute:
        return MaterialPageRoute(builder: (context)=> BlocProvider(
          create: (context)=> di.sl<RandomQuoteCubit>() ,
          child: QuotesScreen(),
        ),
        );
      case Routes.favouriteRoute:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
      default: return onUndefinedRoute();
    }
  }
  static Route<dynamic> onUndefinedRoute(){
    return MaterialPageRoute(builder: (context) =>
    const Scaffold(
      body: Center(
        child: Text(AppStrings.undefinedRoute),
      ),
    )
    );
  }
}