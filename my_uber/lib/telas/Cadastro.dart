import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  bool _TipoUsuarioPassageiro = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Color(0xff37474f),
      ),
      body: Container(

        padding: EdgeInsets.all(16),
        
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                  child: TextField(
                    controller: _controllerNome,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "Nome Completo",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
                  child: TextField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                        hintText: "E-mail",
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6)
                        )
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 15),
                    child: TextField(
                      obscureText: true,
                      controller: _controllerSenha,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Senha",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)
                          )
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: <Widget>[
                      Text("Passageiro"),
                      Switch(
                        value: _TipoUsuarioPassageiro,
                        onChanged:(bool valor){
                        setState(() {
                          _TipoUsuarioPassageiro = valor;
                        });
                      },
                      ),
                      Text("Motorista"),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16,bottom: 10),
                  child: RaisedButton(
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),
                    ),
                    color: Color(0xff1ebbd8),
                    padding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                    onPressed: () {  },

                  ),
                ),
                /*Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      "Erro",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                ) */
              ],
            ),
          ),

      ),
    );
  }
}
