import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/features/zclean_app/domain/entities/quote.dart';
import 'package:flutter/material.dart';

class QuotesContent extends StatelessWidget {

  Quote quote;

  QuotesContent({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),

      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.primary ,
        borderRadius: BorderRadius.all(Radius.circular(20.0)) ,

      ),
      child: Column(
        children: [
          Text(
            textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
              '${quote.content}'
          ) ,
          SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
