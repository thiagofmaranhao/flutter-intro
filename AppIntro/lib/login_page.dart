import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(height: 10),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'Email', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          senha = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'Senha', border: OutlineInputBorder()),
                      ),
                      SizedBox(height: 15),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.lightBlueAccent,
                        onPressed: () {
                          if (email == 'teste@teste.com' && senha == '123') {
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print('Usuario e/ou senha Inválidos');
                          }
                        },
                        child: Container(
                            width: double.infinity,
                            child: Text(
                              'Entrar',
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child:
                Image.asset('assets/images/background.jpg', fit: BoxFit.cover),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          _body(),
        ],
      ),
    );
  }
}
