import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/view/statusPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initializing Firebase Service
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: Home()));
}

//Starting an App with Home Page
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // Wrapping with GetMaterialApp to get the feature of GetX library.
      debugShowCheckedModeBanner: false,
      home: StatusPage(),
    );
  }
}
