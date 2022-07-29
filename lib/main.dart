import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_alpha/pages/Home/Home.dart';
import 'package:test_alpha/pages/logscreens/ForgotPassword.dart';
import 'package:test_alpha/pages/logscreens/SignUp.dart';
import 'package:test_alpha/pages/logscreens/explore.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/SignUp':(context) => const SignUp(),
        '/ForgotPassword':(context) => const resetPassword(),
        '/Home':(context)=>const HomePage(),
      },
      debugShowCheckedModeBanner: false,
      home: const Explore(),
    );
  }
}
