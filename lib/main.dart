import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/utilities/timer.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => TimerLogic(),
        child: const MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fomodoro',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          surface: Color.fromARGB(255, 78, 78, 78),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(color: Color(0x00ffffff)),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
