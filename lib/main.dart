import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'HomePage.dart';
import 'LoginPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
           theme: ThemeData(
        primarySwatch:Colors.blue,
      ),
      home:  LoginPage(),
        debugShowCheckedModeBanner: false,
    );
  }
}

