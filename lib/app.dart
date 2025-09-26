import 'package:flutter/material.dart';


import 'live_exam.dart';




class MyApp extends StatelessWidget{
  MyApp({super.key}) ;

  @override
  Widget build(BuildContext contex){
    return MaterialApp(     // Apps full structure depends on Scaffold()
      title: 'batch-12',
      home: Assigenment(),
    );
  }
}