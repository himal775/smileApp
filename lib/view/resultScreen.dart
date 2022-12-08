import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/view/clock.dart';
import 'package:smile_app/view/firstScreen.dart';
import 'package:smile_app/view/quizMainPage.dart';
import 'package:smile_app/view/viewRank.dart';

//screen to show score, correct answer and incorrect answer.
class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.score, required this.timetaken});

  int score;
  int timetaken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: const Text("Score Card"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Consumer(builder: (context, ref, child) {
        return Container(
          color: Colors.grey[300],
          child: Center(
            child: Container(
              height: 560,
              width: 360,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                  ]),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                const SizedBox(
                  height: 30,
                ),
                score > 70
                    ? const Text(
                        "Great Play, Congratulations!",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      )
                    : const Text(
                        "Well try, Best of Luck for Next Time",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "You have Scored $score in $timetaken seconds",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Text("Score",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 21)),
                        Text("$score",
                            style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontWeight: FontWeight.bold,
                                fontSize: 42))
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Correct",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 21)),
                        Text("${score ~/ 10}",
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 42))
                      ],
                    ),
                    Column(
                      children: [
                        const Text("Wrong",
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: 21)),
                        Text("${10 - (score ~/ 10)}",
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 42))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  child: const Icon(
                    Icons.restart_alt,
                    size: 42,
                  ),
                  onTap: () {
                    Get.to(() => FirstScreen());
                  },
                ),
                const Text("Replay", style: TextStyle(fontSize: 22)),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  child: Container(
                    width: 220,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                    ]),
                    child: Center(
                        child: Text(
                      "Check your Rank in Leaderboard",
                      style: TextStyle(),
                    )),
                  ),
                  onTap: (() {
                    Get.to(() => ViewRank());
                  }),
                )
              ]),
            ),
          ),
        );
      }),
    );
  }
}
