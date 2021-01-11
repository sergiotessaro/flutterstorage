import 'package:flutter/material.dart';
import 'package:testeStorage/store/firebase/firebase.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FireHandler firebaseHandler = FireHandler();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela de Login'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: firebaseHandler.emailController,
                ),
                TextFormField(
                  controller: firebaseHandler.senhaController,
                  obscureText: true,
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 12.0)),
                RaisedButton(
                    child: Text('Criar conta'),
                    onPressed: () async {
                      firebaseHandler.createLogin(
                          firebaseHandler.emailController.text,
                          firebaseHandler.senhaController.text);
                    }),
                RaisedButton(
                    child: Text('Logar'),
                    onPressed: () async {
                       firebaseHandler.doLogin(
                          firebaseHandler.emailController.text,
                          firebaseHandler.senhaController.text,
                          context);

                        String uid = await firebaseHandler.uid(); 
                        print(uid); 
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
