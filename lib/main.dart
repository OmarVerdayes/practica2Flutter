import 'package:flutter/material.dart';
import "package:practica1/screens/ResetPassword.dart";
import "package:practica1/screens/create_account.dart";
import "package:practica1/screens/login.dart";
import "package:practica1/screens/SendEmail.dart";
import "package:practica1/screens/CodeConfirmation.dart";
import 'package:firebase_core/firebase_core.dart';
import "package:practica1/screens/profile.dart";
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/': (context) => const Login(),
        '/SendEmail': (context) => const SendEmail(),
        '/CodeConfirmation': (context) => const CodeConfirmation(),
        '/ResetPassword': (context) => const ResetPassword(),
        '/profile': (context) => const profile(),
        '/register': (context) => const CreateAccount(),
      },
    );
  }
}
