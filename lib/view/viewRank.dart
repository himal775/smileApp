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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
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
                            leading: Icon(Icons.people),
                            title: Text(
                              data['FirstName'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            trailing: Text(
                              "${data['Score']}",
                              style: TextStyle(fontSize: 20),
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
