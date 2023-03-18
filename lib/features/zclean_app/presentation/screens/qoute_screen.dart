import 'dart:math';

import 'package:clean_architecture/config/localization/app_localizations.dart';
import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:clean_architecture/core/utils/constants.dart';
import 'package:clean_architecture/core/utils/assets_manager.dart';
import 'package:clean_architecture/core/widgets/error_widget.dart';
import 'package:clean_architecture/features/splash/splash_screen/presentation/cubit/locale_cubit.dart';
import 'package:clean_architecture/features/zclean_app/presentation/cubit/random_quote_cubit.dart';
import 'package:clean_architecture/features/zclean_app/presentation/widgets/quote_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuotesScreen extends  StatelessWidget {


  Widget _builderContent(){

    return BlocBuilder<RandomQuoteCubit , RandomQuoteState>(builder: (context,state) {
      if(state is RandomQuoteInitial) {
        RandomQuoteCubit.get(context).getRandomQuote();
      }
      if(state is RandomQuoteLoadedState) {
        return Column(

          children: [
            QuotesContent(quote: state.quote),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle ,
                color: AppColors.primary ,
              ),
              child: IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.refresh ,
                  size: 28.0,
                ), onPressed: () {
                  RandomQuoteCubit.get(context).getRandomQuote();
              },
              ),
            )
          ],
        );
      } else if (state is RandomQuoteErrorState){
        return ErrorWidget(state.error);

      }
      else {
        return SpinKitCircle(
          color: AppColors.primary,
          size: 25.0,
        );
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      leading: IconButton(onPressed: (){
        if(AppLocalizations.of(context)!.isEnLocale){
          BlocProvider.of<LocaleCubit>(context).changeLanguageToArabic();
        }else{
          BlocProvider.of<LocaleCubit>(context).changeLanguageToEnglish();
        }
      },
          icon: Icon(
            Icons.translate_outlined,
            color: AppColors.primary,
          )),
      title: Text(AppLocalizations.of(context)!.translate(AppStrings.appTitle)!),
    );
    return Scaffold(
      appBar: appBar,
      body:  _builderContent() ,
    );
  }
}

/*Center(child: InkWell(
        onTap: () => Navigator.pushNamed(context,
        Routes.favouriteRoute),
        child: Image.asset(ImgAssets.quote) ,
      onDoubleTap: ()=> Constants.showErrorDialog(context: context, msg: AppStrings.errorOccured),
      onLongPress: () => Constants.showToast(msg: AppStrings.errorOccured , gravity: ToastGravity.BOTTOM),
      )*/
