import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class FavouriteScreen   extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      
      body: Center(
        child: Text(
          AppStrings.favouriteScreen,
        ),
      ),
    );
  }
}
