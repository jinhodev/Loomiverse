import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home_screen.dart';

void main() => runApp(const MyApp());

// stl 입력 -> stateless 선택 -> 클래스 이름(MyApp) 추가
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
    ); // ThemeData <- closing label // MaterialApp
  }
}
