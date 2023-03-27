import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWIthGoogle {
  static final googleSignIn = GoogleSignIn();
  static GoogleSignInAccount? _user;
  static GoogleSignInAccount get gUser {
    return _user!;
  }

  static Future GoogleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final Credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
    );
    await FirebaseAuth.instance.signInWithCredential(Credential);
  }
}
