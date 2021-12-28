import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user = null;

  void setUser(User? user) {
    _user = user;
  }

  User? getUser() {
    return _user;
  }

  // email&password
  Future<bool?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        signOut();
        return true;
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool?> signInWithEmail(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (credential != null) {
        setUser(credential.user);
        return true;
      }
      return false;
    } on Exception catch (e) {
      return false;
    }
  }

  // SNS
  // Google
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Facebook
  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.token);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }

  signOut() async {
    try {
      print("sing out complete");
      await _auth.signOut();
      setUser(null);
    } catch (e) {
      print("sign out failed");
      print(e.toString());
      return null;
    }
  }
}