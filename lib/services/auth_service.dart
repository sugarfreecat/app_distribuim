import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform, TargetPlatform;

class AuthService {
  String getGoogleSignInClientId() {
    if (kIsWeb) {
      return '805457744542-n3o1seocm8ef363th6rblme905s3nra6.apps.googleusercontent.com';
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return 'ANDROID_CLIENT_ID';
      case TargetPlatform.iOS:
        return '805457744542-75v6rvipp8jd41v4ltr17e5dodu75i19.apps.googleusercontent.com';
      default:
        throw UnsupportedError('Unsupported platform');
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    await GoogleSignIn.instance.initialize(
      clientId: getGoogleSignInClientId(),
    );

    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithGoogleAccount(GoogleSignInAccount account) async {
    final GoogleSignInAuthentication? googleAuth = await account.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth?.idToken,
    );

    return FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn.instance.signOut();
  }
}