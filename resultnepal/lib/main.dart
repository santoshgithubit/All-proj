import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NEPAL ALL WEBSITE",
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const HomePage(),
    );
  }
}
