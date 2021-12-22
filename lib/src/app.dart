import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './page/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("firebase load fail $snapshot"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Home(title: 'Doit! Flutter Study');
        }
        return CircularProgressIndicator();
      },
    );
  }
}
