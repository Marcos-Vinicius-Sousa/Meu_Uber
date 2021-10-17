import 'package:flutter/material.dart';
import 'package:my_uber/model/Usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  TextEditingController _controllerConfirmSenha = TextEditingController();

  bool _TipoUsuario = false;
  String _mensagemErro = "";

  _validarCampos(){

    //Recuperando os dados
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha1 = _controllerSenha.text;
    String senha2 = _controllerConfirmSenha.text;

    //validar campos
    if(nome.isNotEmpty){

      if(email.isNotEmpty && email.contains("@")){

        if(senha1.isNotEmpty && senha2.isNotEmpty && senha1.length > 5){

          if(senha1 == senha2){
            Usuario usuario = Usuario();
            usuario.nome = nome;
            usuario.email = email;
            usuario.senha = senha1;
            usuario.tipoUsuario = usuario.verificarTipoUsuario(_TipoUsuario);

            _cadastrarUsuario(usuario);
          }else{
            setState(() {
              _mensagemErro = "As duas senhas devem ser iguais!";
            });
          }

        }else{
          setState(() {
            _mensagemErro = "A senha deve conter mais que 5 caracteres!";
          });
        }

      }else{
        setState(() {
          _mensagemErro = "preencha com um email válido!";
        });
      }
    }else{
      setState(() {
        _mensagemErro = "preencha o nome!";
      });
    }

  }

  _cadastrarUsuario( Usuario usuario){

    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;
    auth.createUserWithEmailAndPassword(
        email: usuario.email,
        password: usuario.senha).then((firebaseUser){
        db.collection("usuarios")
            .doc(firebaseUser.user.uid)
            .set(usuario.toMap());

        // redirecionar para o painel, de acordo com o Usuario 
    });
  }

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
                  padding: EdgeInsets.fromLTRB(20,10,30,10),
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
                  padding: EdgeInsets.fromLTRB(20,10,30,10),
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
                    padding: EdgeInsets.fromLTRB(20,10,30,10),
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
                    padding: EdgeInsets.fromLTRB(20,10,30,10),
                    child: TextField(
                      obscureText: true,
                      controller: _controllerConfirmSenha,
                      keyboardType: TextInputType.visiblePassword,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Confirme a senha",
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
                        value: _TipoUsuario,
                        onChanged:(bool valor){
                        setState(() {
                          _TipoUsuario = valor;
                        });
                      },
                      ),
                      Text("Motorista"),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.fromLTRB(20,10,30,10),
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
                    onPressed: () {
                      _validarCampos();
                    },

                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),

      ),
    );
  }
}
