
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  final FirebaseAuth auth;
  final GoogleSignIn googleSignIn;

  GoogleService({required this.auth, required this.googleSignIn});

  Future<User?> signInWithGoogle() async {
    try {
      await googleSignIn.initialize(clientId: dotenv.env['FIREBASE_CLIENT_ID']);
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth =
          googleSignInAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.idToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential = await auth.signInWithCredential(
        credential,
      );
      return userCredential.user;
    } catch (e) {
      log("Error signing in with Google: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }
}
