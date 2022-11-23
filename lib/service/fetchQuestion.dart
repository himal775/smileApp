import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smile_app/model/quizModel.dart';
//fetching data from api and adding it to the list.
final quiz = FutureProvider<List>((ref) async {
  List<dynamic> list = [];
  for (int i = 0; i <= 10; i++) {
    final dio = Dio();
    final response = await dio.get("https://marcconrad.com/uob/smile/api.php");
    final result = json.decode(response.data);
    list.add(result['question']);
    list.add(result['solution']);
  }

  return list;
});
