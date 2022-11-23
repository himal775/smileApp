import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:smile_app/view/firstScreen.dart';
import 'package:smile_app/view/secondScreen.dart';
import 'package:smile_app/view/viewRank.dart';
//screen to show score, correct answer and incorrect answer.
class MyWidget extends StatelessWidget {
  MyWidget({super.key, required this.score});

  int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Score Card"),
      ),
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Container(
            height: 560,
            width: 360,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey)
                ]),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 30,
              ),
              score > 70
                  ? Text(
                      "Great Play, Congratulations!",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    )
                  : Text(
                      "Well try, Best of Luck for Next Time",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 21),
                    ),
              SizedBox(
                height: 20,
              ),
              Text(
                "You have Scored $score",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
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
                      Text("Score",
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
                      Text("Correct",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 21)),
                      Text("${score ~/ 10}",
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 42))
                    ],
                  ),
                  Column(
                    children: [
                      Text("Wrong",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontSize: 21)),
                      Text("${10 - (score ~/ 10)}",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 42))
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                child: Icon(
                  Icons.restart_alt,
                  size: 42,
                ),
                onTap: () {
                  Get.to(() => FirstScreen());
                },
              ),
              Text("Replay", style: TextStyle(fontSize: 22)),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
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
      ),
    );
  }
}
