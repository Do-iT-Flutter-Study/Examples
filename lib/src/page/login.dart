import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import './home.dart';
import 'signUp.dart';
import 'emailLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doit! Flutter Study',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(title: 'Doit! Flutter Study'),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscure = true;
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.black,
              size: 128.0,
            ),
            Text("2022 Doit! Flutter Study Application"),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SignInButton(
                    Buttons.Google,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {},
                  ),
                  SignInButton(
                    Buttons.Email,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                EmailLogin(title: widget.title)),
                      );
                    },
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SignUp(title: widget.title)),
                            );
                          },
                          child: Text("SIGN UP NOW"),
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EmailLogin(title: widget.title)),
          );
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}
