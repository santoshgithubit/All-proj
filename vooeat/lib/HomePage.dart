import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SAVANA SUSHI"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Readbox("Voo Eat", "https://vooeat.com/alpha/"),
        ],
      ),
    );
  }
}

class Readbox extends StatelessWidget {
  final String title;
  final String url;
  Readbox(this.title, this.url);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Center(
              child: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          height: 100,
          decoration: BoxDecoration(
              color: Colors.brown, borderRadius: BorderRadius.circular(10)),
        ),
      ),
      onTap: () {
        launchUrlString(url);
      },
    );
  }
}
