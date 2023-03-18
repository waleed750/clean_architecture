import 'package:clean_architecture/app.dart';
import 'package:flutter/material.dart';
import 'injection_container.dart' as di;
import 'bloc_observer.dart';
import 'package:bloc/bloc.dart';
void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  Bloc.observer = MyBlocObserver();
  runApp(CleanApp());
}




