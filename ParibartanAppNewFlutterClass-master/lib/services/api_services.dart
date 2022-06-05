import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:paribartan/models/patient.dart';

var apiHeader = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization':
      'Bearer c154663a5d474dc2e9b39dc561e30eec308af5e1998f9c9a33d6d26ece3e69af21a6e2b81705452b15052229b507e1f2f504d78f3da0c17afb575fa75a74935d2c8c0c0f4b71f40f1bccf38534faf472b5f20f7d70ededa3076279c49bb9e012f1e50fbd75e290f1fbe0e251aef1fad5a05e94e364f38ae05b53964f352079c5',
};

class APIService {
  static String apiURL = "http://192.168.1.66:1337/api/patients";

  static Future<Patient> getPatients() async {
    final response = await http.get(Uri.parse(apiURL), headers: apiHeader);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return Patient.fromJson(data);
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Add
  static Future<bool> addPatient(Attributes a, String pass) async {
    final url = Uri.parse(apiURL);
    String mybody = """
 {
  "data": {
    "name": "${a.name}",
    "birthdate": "${a.birthdate}",
    "gender": "${a.gender}" ,
    "education": "${a.education}",
    "place": "${a.place}",
    "address": "${a.address}",
    "maritialstatus":"${a.maritialstatus}",
    "phone": "${a.phone}",
    "alertstartfrom": "${a.alertstartfrom}",
    "alerttime": "${a.alerttime}",
    "bloodgroup": "${a.bloodgroup}",
    "email": "${a.email}",
    "password": "$pass",
    "occupation": "${a.occupation}"
  }
}
""";
    final response = await http.post(url, body: mybody, headers: apiHeader);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

//   // Delete
//   static Future<bool> deleteQuote(int id) async {
//     final url = Uri.parse("$apiURL/$id");
//     final response = await http.delete(url, headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     });
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   // Update
//   static Future<bool> updateQuote(int id, Attributes a) async {
//     final url = Uri.parse("$apiURL/$id");
//     String mybody = """
//   {
//   "data": {
//     "title": "${a.title}",
//     "from": "${a.from}"
//   }
// }
// """;
//     final response =
//         await http.put(url, body: mybody, headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     });
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     if (response.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
}
