import 'package:flutter/material.dart';
import 'package:my_uber/telas/Home.dart';

final ThemeData temaPadrao = ThemeData(
    primaryColor: Color(0xff37474f),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Color(0xff546e7a))
);

void main() {
  runApp(MaterialApp(
    title: "Uber",
    home: Home(),
    theme: temaPadrao,
    debugShowCheckedModeBanner: false,
  ));
}

