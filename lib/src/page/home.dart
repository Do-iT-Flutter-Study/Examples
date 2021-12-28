import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import './login.dart';
import '../service/auth.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    List _widgetOptions = [
      Text(
        'HomeScreen',
        style: TextStyle(fontSize: 40),
      ),
      Text(
        'FavoriteScreen',
        style: TextStyle(fontSize: 40),
      ),
      Text(
        'MenuScreen',
        style: TextStyle(fontSize: 40),
      ),
      ElevatedButton(
        onPressed: () async {
          await _auth.signOut();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    side: BorderSide(color: Colors.red)))),
        child: Text("Sign out"),
      )
    ];

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.data == null) {
            return Login(title: 'Doit! Flutter Study');
          } else {
            return DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text(widget.title),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.amber,
                    selectedItemColor: Colors.white,
                    unselectedItemColor: Colors.black38,
                    selectedFontSize: 14,
                    unselectedFontSize: 14,
                    currentIndex: _selectedIndex,
                    onTap: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home), title: Text('Home')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.star), title: Text('Favorite')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.menu), title: Text('Menu')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.people), title: Text('My')),
                    ],
                  ),
                  body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
                ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}
