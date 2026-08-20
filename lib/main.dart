import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:user_interface_app/user_interface.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UserInterface(),
    );
  }
}
