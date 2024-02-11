import 'package:flutter/material.dart';
import 'package:resume_app/Pages/login_page.dart';

void main(){
  runApp(HomePage());
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
