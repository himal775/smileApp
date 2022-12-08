import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smile_app/provider/crud.dart';

//view rank in  screen
class ViewRank extends StatelessWidget {
  ViewRank({super.key});
  final Stream<QuerySnapshot> _checkRank =
      FirebaseFirestore.instance.collection('userDetails').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: const Text("View Rank"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
            ]),
            child: StreamBuilder<QuerySnapshot>(
              stream: _checkRank,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Error babe");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                return ListView(
                    children: snapshot.data!.docs
                        .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return ListTile(
                            title: Text(
                              data['FirstName'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            subtitle: Text(
                              "${data['TimeTaken']} seconds",
                            ),
                            trailing: Text(
                              "${data['Score']} points",
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        })
                        .toList()
                        .cast());
              },
            ),
          ),
        ));
  }
}
