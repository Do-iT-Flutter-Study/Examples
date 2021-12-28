import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

import 'home.dart';
import 'signUp.dart';
import 'emailLogin.dart';
import '../service/auth.dart';

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
  AuthService _auth = AuthService();
  bool _isObscure = true;
  bool? _isChecked = false;

  // // 이후 추가로 유저 정보를 가지고 오고 싶다면
  // // String name = "";
  // // String email = "";
  // // String photoUrl = "";
  // // final AuthResult authResult = await signInWithGoogle();
  // // final FirebaseUser user = await signInWithGoogle().user;
  // // currentUser = await _auth.currentUser();
  // // assert(user.uid == currentUser.uid);
  // //
  // // setState(() {
  // // email = user.email;
  // // photoUrl = user.photoUrl;
  // // name = user.displayName;
  // // });

  //
  // // 이후 추가로 유저 정보를 가지고 오고 싶다면
  // // String name = "";
  // // String email = "";
  // // String photoUrl = "";
  // // final AuthResult authResult = await signInWithGoogle();
  // // final FirebaseUser user = await signInWithGoogle().user;
  // // currentUser = await _auth.currentUser();
  // // assert(user.uid == currentUser.uid);
  // //
  // // setState(() {
  // // email = user.email;
  // // photoUrl = user.photoUrl;
  // // name = user.displayName;
  // // });

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
                    onPressed: () {
                      _auth.signInWithGoogle().whenComplete(() =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Home(title: widget.title))));
                    },
                  ),
                  SignInButton(
                    Buttons.Facebook,
                    onPressed: () {
                      _auth.signInWithFacebook().whenComplete(() =>
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Home(title: widget.title))));
                    },
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
