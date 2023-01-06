import 'package:flutter/material.dart';
import 'package:flutterdemo/screens/homeScreen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFFE4616B),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.grey[850]),
        ),
        cardColor: const Color(0xFFECE7DC),
      ),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
