import 'package:firebase_auth/firebase_auth.dart';

final userEmail = FirebaseAuth.instance.currentUser!.email;
