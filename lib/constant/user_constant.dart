import 'package:firebase_auth/firebase_auth.dart';

String userEmail =
    FirebaseAuth.instance.currentUser?.email ?? "sharmin@gmail.com";
