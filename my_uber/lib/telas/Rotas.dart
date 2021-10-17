import 'package:flutter/material.dart';
import 'package:my_uber/telas/Cadastro.dart';

import 'Home.dart';

class Rotas {

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
       case"/":
        return MaterialPageRoute(
            builder: (_) => Home()
        );

      case"/cadastro":
        return MaterialPageRoute(
            builder: (_) => Cadastro()
        );
        break;

      default:
        _erroRota();
    }
    return throw "";
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Tela não encontrada!"),
            ),
            body: Center(
              child: Text("Tela não encontrada!"),
            ),
          );
        }
    );
  }
}