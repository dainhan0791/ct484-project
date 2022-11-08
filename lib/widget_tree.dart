import 'package:flutter/material.dart';
import 'package:flutter_application_b1909960/pages/home_page.dart';
import 'package:flutter_application_b1909960/pages/auth_page.dart';
import 'package:flutter_application_b1909960/pages/user_page.dart';
import 'package:flutter_application_b1909960/services/auth_service.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().authStateChanges,
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
