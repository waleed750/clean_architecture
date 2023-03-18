import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/media_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  VoidCallback? onPress;

  ErrorScreen({this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning_amber_rounded ,
           size: 120.0,
           color: AppColors.primary,
          ) ,
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('Something went wrong' ,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700 ,
            ),
            ),
          ),

          Text('Please Try Again' ,
          style: TextStyle(
            fontWeight: FontWeight.w500 ,
            fontSize: 18.0 ,
            color: Colors.grey
          ),
          ),
          Container(
            height: 50.0,
            width: context.width * 0.55,
            margin: const EdgeInsets.symmetric(
              vertical: 20.0
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: AppColors.primary ,
                elevation: 500,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(50) ,
                )
              ),
              onPressed: () {
                onPress!();
              },
              child: Text(
                'Reload Screen' ,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700 ,
                  color: Colors.white
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
