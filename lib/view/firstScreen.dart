import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/provider/auth.dart';
import 'package:smile_app/view/secondScreen.dart';

//first screen that pops up after login successful

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
          drawer: Drawer(
            child: InkWell(
              child: const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              onTap: () {
                ref.read(authprovider).logout();
              },
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.red[400],
            elevation: 0,
          ),
          body: ListView(children: [
            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                "Welcome to Smile App",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ),
            CircleAvatar(
              radius: 60,
              child: ClipOval(
                child: Image.network(
                    "https://i.pinimg.com/736x/31/6d/86/316d8698b5c9abb78778d411a5d39544.jpg"),
              ),
            ),
            // SizedBox(
            //   height: 200,
            // ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 350,
                width: 50,
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  )
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Rules and Regulations to be follow",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "1. The total number of questions will be 10",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "2. Each question occupies 10 marks",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "3.There will not be negative marking.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "4. 15 seconds for each question",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text("5. Rules and Regulations to be follow"),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (val) {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            }),
                        const Text(
                          "I understand  the following rules and regulations.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  color: isChecked ? Colors.red : Colors.red.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  child: const Center(
                      child: Text(
                    "Let's Play Quiz",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                  onTap: () {
                    // ref.read(clockProvider.notifier).dispose();
                    isChecked ? Get.to(() => SecondScreen()) : null;
                  },
                ),
              ),
            )
          ]));
    });
  }
}
