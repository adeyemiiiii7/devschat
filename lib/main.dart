import 'package:devschat/screens/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'devschat',
        theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromARGB(0, 11, 57, 106)),
        ),
        home: const AuthScreen());
  }
}
