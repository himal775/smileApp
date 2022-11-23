import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

//creating authentication using riverpod state management solution

final authprovider = Provider(((ref) => Auth()));

class Auth {
  //future function for signup

  Future<String> signup(
      String firstName, String email, String password, int score) async {
    try {
      final response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      final uid = response.user!.uid;
      final userdata =
          FirebaseFirestore.instance.collection("userDetails").doc(uid);

      userdata.set(
          {'FirstName': firstName, 'email': email, 'uid': uid, 'Score': score});

      return "Successfully";
    } on FirebaseAuthException catch (error) {
      throw SnackBar(content: Text(error.toString()));
    } on AsyncLoading {
      return "Loading";
    }
  }

  //future function for login
  Future<String> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return "Successfully";
    } on FirebaseAuthException catch (error) {
      return "$error";
    }
  }

//FUTURE FUNCTION FOR LOGGING OUT
  Future<String> logout() async {
    try {
      FirebaseAuth.instance.signOut();
      return "Success";
    } on FirebaseAuthException catch (err) {
      return "$err";
    }
  }
}
