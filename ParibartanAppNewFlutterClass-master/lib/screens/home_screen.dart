import 'package:flutter/material.dart';
import 'package:paribartan/models/patient.dart';

import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  final Attributes a;
  HomeScreen(this.a);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Patient> futureQuotes;
  @override
  void initState() {
    super.initState();
    futureQuotes = APIService.getPatients();
  }

  void refresh() {
    setState(() {
      futureQuotes = APIService.getPatients();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ${widget.a.name}"),
      ),
      body: FutureBuilder<Patient>(
          future: futureQuotes,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshIndicator(
                onRefresh: () async {
                  refresh();
                },
                child: ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (contxt, index) {
                    return ListTile(
                      title: Text(snapshot.data!.data[index].attributes.name),
                      subtitle: Text(
                          snapshot.data!.data[index].attributes.bloodgroup),
                      leading: CircleAvatar(
                        child: Text(snapshot.data!.data[index].id.toString()),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              size: 20.0,
                            ),
                            onPressed: () async {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 20.0,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
