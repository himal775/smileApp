import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smile_app/model/quizModel.dart';

final quizScore = Provider(((ref) => Update()));

//provider for updating score in the server.
class Update {
  Future<String> updateScore(
      {required int score, required int timetaken}) async {
    try {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final response =
          FirebaseFirestore.instance.collection('userDetails').doc(uid);
      await response.update({'Score': score, 'TimeTaken': timetaken});
      return "Successful";
    } on FirebaseAuthException catch (error) {
      return "$error";
    }
  }

//stream provider used for getting score from server and showing in view rank page.
  Stream<List<Quiz>> readScore() {
    final userdb = FirebaseFirestore.instance.collection('userDetails');
    return userdb.snapshots().map((event) => readScoreData(event));
  }

  List<Quiz> readScoreData(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return Quiz(
          FullName: json['FirstName'],
          Score: json['Score'],
          timetaken: json['TimeTaken']);
    }).toList();
  }
}
