import 'package:api_learning/example_five.dart';
import 'package:api_learning/example_four.dart';
import 'package:api_learning/example_three.dart';
import 'package:api_learning/example_two.dart';
import 'package:api_learning/example_one.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExampleFive(),
    );
  }
}
