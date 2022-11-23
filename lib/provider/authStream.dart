import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//state of user 
final authStream =
    StreamProvider(((ref) => FirebaseAuth.instance.authStateChanges()));
