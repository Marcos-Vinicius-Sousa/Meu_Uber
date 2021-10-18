import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_uber/model/Usuario.dart';
import 'package:my_uber/telas/PainelPassageiro.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  String _menssagemErro = "";

  _logarUsuario(Usuario usuario) {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha
    ).then((firebaseUser) {

      _redirecionarPainelPorTipo( firebaseUser.user!.uid);

      //Navigator.pushReplacementNamed(context,"/");
      /*Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PainelPassageiro()
          )
      );*/
    }).catchError((error) {
      setState(() {
        _menssagemErro =
        "Erro ao identificar usuário, verifique e-mail e senha e tente novamente.";
      });
    });
  }

  _redirecionarPainelPorTipo(String idUsuario) async {

    FirebaseFirestore db =FirebaseFirestore.instance;

    DocumentSnapshot snapshot = await db.collection("usuarios")
    .doc(idUsuario)
    .get();

    Map<String, dynamic>? dados = snapshot.data() as Map<String, dynamic>?;
    String tipoUsuario = dados!["tipoUsuario"];

    switch(tipoUsuario){
      case "motorista":
        Navigator.pushReplacementNamed(context, "/painel-motorista");
        break;
      case "passageiro":
        Navigator.pushReplacementNamed(context, "/painel-passageiro");
        break;
    }
  }

  _validarCampos() {
    //Recuperando os dados
    String email = _controllerEmail.text;
    String senha1 = _controllerSenha.text;


    //validar campos
    if (email.isNotEmpty && email.contains("@")) {
      if (senha1.isNotEmpty) {
        setState(() {
          _menssagemErro = "";
        });
        Usuario usuario = Usuario();
        usuario.email = email.replaceAll(" ", "");
        usuario.senha = senha1.replaceAll(" ", "");
        _logarUsuario(usuario);
      } else {
        setState(() {
          _menssagemErro = "Preencha a senha.";
        });
      }
    } else {
      setState(() {
        _menssagemErro = "Preencha o e-mail utilizando  @";
      });
    }
  }

  Future _verificarUsuarioLogado() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
    // recuperando o usuario que esta logado no momento
    User? usuarioLogado = await auth.currentUser;
    if (usuarioLogado != null) {
      Navigator.pushReplacementNamed(context, "/");
    }
  }

  @override
  void initState() {
    _verificarUsuarioLogado();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
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
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 5),
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
                    padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
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
                  padding: EdgeInsets.fromLTRB(10, 20, 20, 20),
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
                    onPressed: () {
                      _validarCampos();
                    },
                  ),
                ),
                Center(
                  child: GestureDetector(
                    child: Text("Não tem conta ? Cadastre-se!",
                        style: TextStyle(color: Colors.white)
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, "/cadastro");
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _menssagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


