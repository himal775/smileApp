import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:smile_app/view/clock.dart';
import 'package:smile_app/view/firstScreen.dart';
import 'package:smile_app/provider/crud.dart';
import 'package:smile_app/service/fetchQuestion.dart';
import 'package:smile_app/view/thirdScreen.dart';

//screent to play quiz
class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int ques = 0;
  int ans = 1;
  int num = 1;
  int score = 100;
  int flex = 1;
  int plex = 9;
  bool valueA = false;
  bool valueB = false;
  bool valueC = false;
  bool valueD = false;

  var time = 30;
  Timer? hey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(
          "Quiz Main Page",
          style: const TextStyle(color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          var question = ref.watch(quiz);
          final currentTime = ref.watch(clockProvider);

          return question.value != null
              ? Container(
                  color: Colors.grey[350],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: flex,
                            child: Container(
                              height: 10,
                              color: Colors.grey,
                            ),
                          ),
                          Flexible(
                              flex: plex,
                              child: Container(
                                height: 10,
                                color: Colors.white,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                        radius: 60,
                        child: ClipOval(child: Text("$currentTime")),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "$num. Solve the given equation and pick right answer",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 200,
                        width: 550,
                        decoration:
                            BoxDecoration(color: Colors.white, boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                            spreadRadius: 1,
                          )
                        ]),
                        child: Image.network("${question.value![ques]}"),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: valueA ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "a.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: valueA
                                              ? Colors.white
                                              : Colors.blue),
                                    ),
                                    Text("${question.value![ans] - 1}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: valueA
                                                ? Colors.white
                                                : Colors.blue))
                                  ]),
                            ),
                            onTap: () {
                              setState(() {
                                valueA = !valueA;
                                valueB = false;
                                valueC = false;
                                valueD = false;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: valueB ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "b.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: valueB
                                              ? Colors.white
                                              : Colors.blue),
                                    ),
                                    Text("${question.value![ans]}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: valueB
                                                ? Colors.white
                                                : Colors.blue))
                                  ]),
                            ),
                            onTap: () {
                              setState(() {
                                valueB = !valueB;
                                valueA = false;
                                valueC = false;
                                valueD = false;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                  color: valueC ? Colors.green : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                        color: Colors.grey)
                                  ]),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "c.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: valueC
                                              ? Colors.white
                                              : Colors.blue),
                                    ),
                                    Text("${question.value![ans] + 1}",
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: valueC
                                                ? Colors.white
                                                : Colors.blue))
                                  ]),
                            ),
                            onTap: (() {
                              setState(() {
                                valueC = !valueC;
                                valueA = false;
                                valueB = false;
                                valueD = false;
                              });

                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) =>
                              //           MyWidget()), // this mainpage is your page to refresh
                              //   (Route<dynamic> route) => false,
                              // );
                            }),
                          ),
                          InkWell(
                            child: Container(
                              height: 40,
                              width: 180,
                              decoration: BoxDecoration(
                                color: valueD ? Colors.green : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                // boxShadow: [
                                //   BoxShadow(
                                //       blurRadius: 1,
                                //       spreadRadius: 1,
                                //       color: Colors.black)
                                //]
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "d.",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: valueD
                                              ? Colors.white
                                              : Colors.blue),
                                    ),
                                    Text(
                                      "${question.value![ans] + 2}",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: valueD
                                              ? Colors.white
                                              : Colors.blue),
                                    )
                                  ]),
                            ),
                            onTap: () {
                              setState(() {
                                valueD = !valueD;
                                valueA = false;
                                valueB = false;
                                valueC = false;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // Text("$score"),
                      InkWell(
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                              child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        onTap: () {
                          // ques < 18
                          //     ? null
                          //     : ref.read(clockProvider.notifier).dispose();
                          valueB ? (score = score + 10) : (score = score - 10);
                          ref.read(quizScore).updateScore(score: score);

                          ques < 18
                              ? setState(() {
                                  num++;
                                  ques = ques + 2;
                                  ans = ans + 2;
                                  flex = flex + 1;
                                  plex = plex - 1;
                                  valueA = false;
                                  valueB = false;
                                  valueC = false;
                                  valueD = false;

                                  ref.read(clockProvider.notifier).restart();
                                })
                              : //ref.read(clockProvider.notifier).dispose();
                              Get.to(() => MyWidget(
                                    score: score,
                                  ));
                        },
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
        }),
      ),
    );
  }
}
