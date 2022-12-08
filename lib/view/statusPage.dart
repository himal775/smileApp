import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:smile_app/LoginPage.dart';
import 'package:smile_app/view/firstScreen.dart';
import 'package:smile_app/provider/authStream.dart';

//checking state of user.
class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authdata = ref.watch(
            authStream); // Watching authStream to know whether user is logged in or not.

        return authdata.when(data: ((data) {
          if (data != null) {
            return const FirstScreen();
          } else {
            return const LoginPage();
          }
        }), error: ((error, stackTrace) {
          return Text("$error");
        }), loading: (() {
          return const CircularProgressIndicator();
        }));
      },
    );
  }
}
