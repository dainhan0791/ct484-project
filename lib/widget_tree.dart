import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_b1909960/pages/home_page.dart';
import 'package:flutter_application_b1909960/pages/login_register.dart';
import 'package:flutter_application_b1909960/services/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
