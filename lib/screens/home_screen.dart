import 'package:flutter/material.dart';
import 'dart:math'; // 수학적 계산을 위한 패키지
import 'package:flutter_app/widgets/buildSmallCircle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 101,
                      height: 42,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '집중',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 101,
                      height: 42,
                      decoration: const BoxDecoration(),
                      child: const Center(
                        child: Text(
                          '휴식',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 234, 98, 98),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text('10:25',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  for (int i = 0; i < 60; i++)
                    SmallCircle(
                      index: i, // 각 원의 인덱스
                      totalCircles: 60, // 전체 원의 개수
                      radius: 100, // 중앙 원으로부터의 거리
                    ),
                ],
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text(
                      '-5',
                      style: TextStyle(
                        color: Color.fromARGB(255, 234, 98, 98),
                      ),
                    ),
                  ),
                  const SizedBox(width: 11), // 폭을 지정합니다.
                  IconButton(
                    icon: const Icon(
                      Icons.play_arrow,
                      size: 45.0, // 아이콘 크기
                      color: Color.fromARGB(255, 234, 98, 98), // 아이콘 색상
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(80, 80),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  const SizedBox(width: 11), // 폭을 지정합니다.ㄴ
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      minimumSize: const Size(50, 50),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text(
                      '+5',
                      style: TextStyle(
                        color: Color.fromARGB(255, 234, 98, 98),
                      ),
                    ),
                  ),
                ],
              )),
            ),
          ]),
    );
  }
}
