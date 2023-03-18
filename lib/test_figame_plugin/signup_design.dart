import 'package:clean_architecture/core/utils/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends  StatelessWidget {

  var  color = HexColor("222222");
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light ,
        statusBarIconBrightness: Brightness.dark ,
        statusBarColor: Colors.transparent
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: ()=> null,
          icon: Icon(
            Icons.arrow_back_ios  ,
            color: Colors.black,
          ),
        ),
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Sign up' ,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                color: Colors.black ,
                fontWeight: FontWeight.bold ,

              ),
            ),
            const SizedBox(
              height: 35.0,
            ) ,
            textBox(),
          ],
        ),
      )      // Figma Flutter Generator SignuppageWidget - FRAME
    );
  }
  Widget textBox()=> Container(
    decoration: BoxDecoration(

    ),
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          alignLabelWithHint: true,
          labelText: "Name",
          labelStyle: TextStyle(
            color: Colors.grey ,
            fontSize: 20.0
          ),

        ),
    ),
  );
}
