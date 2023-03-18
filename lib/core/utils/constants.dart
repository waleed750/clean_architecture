import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showErrorDialog({required BuildContext context , required String msg}) {
    showDialog(context: context,

        builder: (context) => CupertinoAlertDialog(
          title: Text(msg ,
          style: const TextStyle(
            color: Colors.black  ,
            height: 1.2 ,
            fontSize: 16.0 ,
          ),
          ),

          actions: [
            TextButton(onPressed: ()=>{
                Navigator.pop(context)
            } ,
            style: TextButton.styleFrom(
              primary: Colors.black ,
            ),
              child: const Text(AppStrings.ok ,

              style: TextStyle(
                fontWeight: FontWeight.bold,
              fontSize: 16.0
              ),
              ),
            )
          ],
        ));
  }
  static void showToast({required String msg ,
  ToastGravity? gravity ,
  Color? color ,
  Color?  textColor,
  }){
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity:  gravity ?? ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: color ?? Colors.red,
        textColor:  textColor ?? Colors.white,
        fontSize: 16.0
    );
  }
}