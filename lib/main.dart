import 'dart:async';

import 'package:flutter/material.dart';
import 'package:list_car_app/controller/car_controller.dart';
import 'package:list_car_app/view/car_list_screen_view.dart';


void main() {
  runApp(const MyApp());
    Timer.periodic(const Duration(hours: 1), (Timer t) => CarController().sendLeads());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const  CarListScreenView(),
    );
  }
}

