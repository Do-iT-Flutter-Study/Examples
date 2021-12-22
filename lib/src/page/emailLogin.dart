import 'package:flutter/material.dart';

import './home.dart';
import 'signUp.dart';
import 'forgotPassword.dart';


class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
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
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.people),
                        labelText: 'ID',
                        hintText: "Enter your ID",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          borderSide:
                          BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                          borderSide:
                          BorderSide(width: 1, color: Colors.redAccent),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  TextField(
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
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide:
                        BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                        borderSide:
                        BorderSide(width: 1, color: Colors.redAccent),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ForgotPassword(title: widget.title)),
                            );
                          },
                          child: Text("Forgot Password?"),
                        )
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Checkbox(
                          value: _isChecked,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ]),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Home(title: widget.title)),
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.red),
                            foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(32.0)),
                                    side: BorderSide(color: Colors.red)))),
                        child: Text("Login"),
                      )),
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
                builder: (context) => Home(title: widget.title)),
          );
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}
