import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medi_app/controllers/db_helper.dart';
import 'package:medi_app/pages/login_page.dart';
import 'package:medi_app/pages/welcome_screen.dart';

DbHelper dbHelper = DbHelper();
String val = '';
Future getName() async {
  String? name = await dbHelper.getName();

  if (name != null) {
    val = name;
  }
}

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('health');

  getName();
  if (val != '') {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'lato'),
        home: const WelcomeScreen()));
  } else {
    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'lato'),
        home: const LoginPage()));
  }
}
