import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'home.dart';
import '../service/auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final idController = TextEditingController();
  final pwController = TextEditingController();
  final confirmController = TextEditingController();

  AuthService _auth = AuthService();

  bool _isObscure = true;
  bool? _isChecked = false;

  @override
  void dispose() {
    idController.dispose();
    pwController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        controller: idController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.people),
                          labelText: 'ID',
                          hintText: "Enter your ID",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: pwController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          labelText: 'Password',
                          hintText: "Enter your password",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: confirmController,
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: Icon(_isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              }),
                          labelText: 'Confirm password',
                          hintText: "Enter your password",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                            borderSide:
                                BorderSide(width: 1, color: Colors.redAccent),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(32.0)),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (pwController.text != confirmController.text) {
                                dialog(
                                    "Password error",
                                    "Password end confirm password don't match",
                                    "OK");
                              } else {
                                _auth
                                    .signUpWithEmail(
                                        idController.text, pwController.text)
                                    .catchError((onError) {
                                  print(onError);
                                }).then((result) => {
                                          if (result == 'success')
                                            {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Home(
                                                        title: widget.title)),
                                              )
                                            }
                                          else if (result == 'error')
                                            {
                                              dialog("Sign-Up error",
                                                  "Sign-Up error", "OK")
                                            }
                                          else
                                            {
                                              dialog(result,
                                                  "Check the error", "OK")
                                            }
                                        });
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0)),
                                        side: BorderSide(color: Colors.red)))),
                            child: Text("Sign up"),
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("SIGN IN"),
                            ),
                          ]),
                      Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 0, right: 20.0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        Text("OR"),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(left: 20.0, right: 0),
                              child: Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ]),
                      SignInButton(
                        Buttons.Google,
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Facebook,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void dialog(String title, String content, String action) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              title: Column(children: <Widget>[
                Text(title),
              ]),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[Text(content)]),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(action))
              ]);
        });
  }
}
