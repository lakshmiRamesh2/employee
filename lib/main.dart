import 'dart:async';

import 'package:employe/local_db.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

import 'home_Screen.dart';

void main() async {


  runApp(MyApp());

  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.

  LocalDatabase().createDb();

}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


