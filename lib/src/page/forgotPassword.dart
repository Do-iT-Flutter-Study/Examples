import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _isObscure = true;
  bool _isChecked = false;

  void _show() {
    setState(() {
      _isChecked = true;
    });
  }

  void _hide() {
    setState(() {
      _isChecked = false;
    });
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
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Reset\nPassword",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text("Enter the email address\nassociated with your account",
                          style: TextStyle(fontSize: 24),),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Visibility(
                          visible: !_isChecked,
                          child: Column(
                            children: [
                              TextField(
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
                                  labelText: 'Verification code',
                                  hintText: "Enter your verification code",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent),
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
                                      _isChecked ? _hide() : _show();
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
                                    child: Text("Email verification"),
                                  )),
                            ],
                          )),
                      Visibility(
                          visible: _isChecked,
                          child: Column(
                            children: [
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
                                  labelText: 'New password',
                                  hintText: "Enter your new password",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent),
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
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(32.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent),
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
                                      Navigator.pop(context);
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
                                    child: Text("Reset password"),
                                  )),
                            ],
                          )),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
