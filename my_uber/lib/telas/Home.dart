import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("imagens/fundo.png"),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png",
                width: 200,
                height: 150,
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
                    padding: EdgeInsets.only(top: 16,bottom: 10),
                child: RaisedButton(
                  child: Text(
                      "Entrar",
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
                Center(
                  child: GestureDetector(
                    child: Text("Não tem conta ? Cadastre-se!",
                    style: TextStyle(color: Colors.white)
                    ),
                    onTap: (){

                    },
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
      ),
    );
  }
}

