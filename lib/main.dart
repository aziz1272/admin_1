import 'package:admin_1/pages/add_food.dart';
import 'package:admin_1/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Admin Panel",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AddFood()
    );
  }
}

