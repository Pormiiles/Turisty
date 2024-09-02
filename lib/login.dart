import 'package:flutter/material.dart';
import 'package:turisty/passwordReset.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff38726C),
        title: Text("Login"),
      ),
      backgroundColor: Color(0xff38726C),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "Fazer login em sua conta",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Username ou e-mail',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // adicionar a lógica de login aqui
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffE57A44),
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    "Entrar",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Não tem uma conta? Cadastre-se!",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 14,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PasswordResetScreen())
                  );
                },
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 14,
                  ),
                ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}