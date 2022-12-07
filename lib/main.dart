import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/LoginPage.dart';
import 'package:smile_app/view/clock.dart';
import 'package:smile_app/view/firstScreen.dart';

import 'package:smile_app/view/secondScreen.dart';
import 'package:smile_app/signup.dart';
import 'package:smile_app/view/statusPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[100],
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
          )),
      debugShowCheckedModeBanner: false,
      home: StatusPage(),
    );
  }
}
