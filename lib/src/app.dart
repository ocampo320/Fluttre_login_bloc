import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/ui/login_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      home: Scaffold(
            body: SafeArea(
              child: LoginPage(),
            ),
      ),
    );
  }
}
