import 'dart:async';

import 'package:clean_architecture/config/routes/app_routes.dart';
import 'package:clean_architecture/core/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen  extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer ;
  _goNext(){
    Navigator.pushReplacementNamed(context,
        Routes.quoteRoute);
  }

  _startTimer () {
   _timer = Timer(const Duration(milliseconds: 2000),() => _goNext(),);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(ImgAssets.splash),
      ),
    );
  }

}
