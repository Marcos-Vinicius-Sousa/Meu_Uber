import 'package:flutter/material.dart';

class PainelPassageiro extends StatefulWidget {
  const PainelPassageiro({Key? key}) : super(key: key);

  @override
  _PainelPassageiroState createState() => _PainelPassageiroState();
}

class _PainelPassageiroState extends State<PainelPassageiro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Painel Passageiro"),
          backgroundColor: Color(0xff37474f)
      ),
      body: Container(

      ),
    );
  }
}
