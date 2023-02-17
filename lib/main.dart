import 'package:flutter/material.dart';
import 'package:flutter_application_1/Provider/Screeens/AuthLoginExampleAPi.dart';
import 'package:flutter_application_1/Provider/Screeens/CounterExample.dart';
import 'package:flutter_application_1/Provider/Screeens/FavouriteItems/FavouriteExample.dart';
import 'package:flutter_application_1/Provider/Screeens/SliderExample.dart';
import 'package:flutter_application_1/Provider/Screeens/valueListenerStateLess.dart';
import 'package:flutter_application_1/Provider/providerExample/CounterExampleProvider.dart';
import 'package:flutter_application_1/Provider/providerExample/FavouriteExampleProvider.dart';
import 'package:flutter_application_1/Provider/providerExample/LoginAuthProvider.dart';
import 'package:flutter_application_1/Provider/providerExample/SliderExample.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CounterExampleProvider(),),
        ChangeNotifierProvider(create: (_)=> SliderExampleProvider(),),
        ChangeNotifierProvider(create: (_)=> FavouriteExampleProvider(),),
        ChangeNotifierProvider(create: (_)=> LoginAuthProvider(),),
      ],
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthLoginAPi(),
    )
      );
  }
}

