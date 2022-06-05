import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Readbox(
            "SEE Result",
            "https://see.ntc.net.np/",
          ),
          Readbox("NEB Result", "https://neb.ntc.net.np/"),
          Readbox("PU Result", "https://pu.edu.np/"),
          Readbox("TU Result", "https://tuexam.edu.np/"),
          Readbox("KU Result", "https://ku.edu.np/"),
          Readbox("Pan Card ",
              "https://taxpayerportal.ird.gov.np/taxpayer/app.html"),
          Readbox("E Passport From", "https://emrtds.nepalpassport.gov.np/"),
          Readbox("National ID Card", "http://www.nidmc.gov.np/PreEnrollment/"),
          Readbox("Election Commission", "https://election.gov.np/en"),
          Readbox("Police Report", "https://opcr.nepalpolice.gov.np/#/login"),
          Readbox("Your Internet Speed", "https://fast.com/"),
          Readbox("Short Videos ", "https://www.tiktok.com/"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(10)),
            ),
          )
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
