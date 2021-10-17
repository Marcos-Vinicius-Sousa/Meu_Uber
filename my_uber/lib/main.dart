import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_uber/telas/Home.dart';
import 'package:my_uber/telas/Rotas.dart';

final ThemeData temaPadrao = ThemeData(
    primaryColor: Color(0xff37474f),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xff546e7a))
);

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    title: "Uber",
    home: Home(),
    theme: temaPadrao,
    initialRoute: "/",
    onGenerateRoute: Rotas.generateRoute,
    debugShowCheckedModeBanner: false,
  ));
}

