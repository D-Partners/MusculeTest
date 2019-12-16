import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muscule_test/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String ans = await loadAnswers();
  var json = jsonDecode(ans);
  List<String> codec = new List<String>.from(json);

  runApp(
    new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(answers: codec,),
    ),
  );
}

Future<String> loadAnswers() async {
  return await rootBundle.loadString("assets/answers.json");
}
