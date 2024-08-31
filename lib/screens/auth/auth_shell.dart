import 'package:flutter/material.dart';

class AuthShell extends StatelessWidget {
  final Widget child;

  const AuthShell({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}