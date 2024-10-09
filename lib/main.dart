import 'package:flutter/material.dart';
import "package:practica1/screens/ResetPassword.dart";
import "package:practica1/screens/login.dart";
import "package:practica1/screens/SendEmail.dart";
import "package:practica1/screens/CodeConfirmation.dart";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=> const Login(),
        '/SendEmail':(context)=> const SendEmail(),
        '/CodeConfirmation':(context)=> const CodeConfirmation(),
        '/ResetPassword':(context)=> const ResetPassword(),
      },
    );
  }
}
