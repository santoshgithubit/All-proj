import "package:flutter/material.dart";
import 'package:login_app/Screens/hompage_screen.dart';

class LoginPage extends StatelessWidget {
  static const routName = "/login";
  TextEditingController cusername= TextEditingController();
  TextEditingController cpassword= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: cusername,
              decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.8)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 0.8, color: Colors.green)),
            hintText: "Enter User Name",
            prefixIcon: const Icon(Icons.person),
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: cpassword,
              obscureText: true,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(width: 0.8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 0.8, color: Colors.green)),
                  hintText: "Enter Password",
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: const Icon(Icons.visibility))),
        ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                primary: Colors.red, minimumSize: const Size(200, 50)),
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routName);
            },
            icon: const Icon(Icons.login),
            label: const Text("Login")),
            TextButton.icon(onPressed: (){}, icon: const Icon(Icons.password_rounded), label: const Text("Forget Password"))
      ],
    ));
  }
}
