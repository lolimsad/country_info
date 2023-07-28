import 'package:unilist/homepage.dart';
import 'package:unilist/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'home',
    routes: {
      'home' : (context)=> home(),
      'result' : (context)=>result(),
    },
  ));
}

