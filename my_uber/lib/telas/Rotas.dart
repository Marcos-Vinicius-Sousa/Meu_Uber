import 'package:flutter/material.dart';
import 'package:my_uber/telas/Cadastro.dart';
import 'package:my_uber/telas/PainelMotorista.dart';
import 'package:my_uber/telas/PainelPassageiro.dart';

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
      case"/painel-motorista":
        return MaterialPageRoute(
            builder: (_) => PainelMotorista()
        );
      case"/painel-passageiro":
        return MaterialPageRoute(
            builder: (_) => PainelPassageiro()
        );


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