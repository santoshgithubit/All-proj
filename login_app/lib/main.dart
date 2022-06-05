import 'package:flutter/material.dart';

import 'Screens/hompage_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/register_screen.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: LoginPage.routName,
     routes:{
        HomePage.routName: (context)=> const HomePage(),
        RegisterPage.routName: (context)=>const RegisterPage(),
        LoginPage.routName: (context)=> LoginPage(),
      },
    );
  }
}