

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _Usuario;
  String? _Senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.account_box,size: 125,color: Colors.blue,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Usuario',
                  ),
                  onChanged:(value) {
                    setState(() {
                      _Usuario = value;
                    });
                  }
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Senha',
                  ),
                  obscureText: true,
                  onChanged:(value) {
                    setState(() {
                      _Senha = value;
                    });
                  }
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton  (
              child: Text('Login'),

              onPressed: () {
                // Do something with the username and password
                if(_Usuario == 'admin'){
                  if(_Senha == 'admin'){

                    print('Usuario Autenticado');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }else{
                    showDialog(context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            content: Text('Usuario ou senha incorreto'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Fechar'),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );

                        });
                  }

                }
              },
            ),
          ],
        ),
      ),
    );
  }
}