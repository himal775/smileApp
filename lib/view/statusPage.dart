import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/LoginPage.dart';
import 'package:smile_app/view/firstScreen.dart';
import 'package:smile_app/provider/authStream.dart';
import 'package:smile_app/provider/loginProvider.dart';

//checking state of user.
class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final authdata = ref.watch(authStream);

        return authdata.when(data: ((data) {
          if (data != null) {
            return FirstScreen();
          } else {
            return LoginPage();
          }
        }), error: ((error, stackTrace) {
          return Text("$error");
        }), loading: (() {
          return CircularProgressIndicator();
        }));
      },
    );
  }
}
