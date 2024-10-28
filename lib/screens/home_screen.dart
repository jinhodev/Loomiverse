import 'package:flutter/material.dart';
import 'dart:math'; // 수학적 계산을 위한 패키지
import 'package:flutter_app/widgets/buildSmallCircle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../utilities/timer.dart'; // TimerLogic 파일 임포트

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isRunning = false;

  void toggleTimer() {
    setState(() {
      isRunning = !isRunning;
      if (isRunning) {
        Provider.of<TimerLogic>(context, listen: false).startTimer();
      } else {
        Provider.of<TimerLogic>(context, listen: false).stopTimer();
      }
    });
  }

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
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Consumer<TimerLogic>(
              builder: (context, timerLogic, child) {
                int filledCircles = (timerLogic.remainingSeconds / 60)
                    .ceil(); // 남은 시간 기반 채워진 원의 개수
                int startOffset = 30; // 원하는 시작 위치 (인덱스 15번부터 시작 예시)

                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 234, 98, 98),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          timerLogic.time,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    for (int i = 0; i < 60; i++)
                      SmallCircle(
                        index: i,
                        totalCircles: 60,
                        radius: 100,
                        color: (i >= startOffset &&
                                    i < startOffset + filledCircles) ||
                                (startOffset + filledCircles > 60 &&
                                    i < (startOffset + filledCircles) % 60)
                            ? Colors.red
                            : Colors.white,
                      ),
                  ],
                );
              },
            ),
          ),
          Flexible(
            flex: 4,
            fit: FlexFit.tight,
            child: Container(
              child: Consumer<TimerLogic>(
                builder: (context, timerLogic, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<TimerLogic>(context, listen: false)
                              .subtractTime(300);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          minimumSize: const Size(50, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          '-5',
                          style: TextStyle(
                            color: Color.fromARGB(255, 234, 98, 98),
                          ),
                        ),
                      ),
                      const SizedBox(width: 11),
                      IconButton(
                        icon: Icon(
                          timerLogic.isTimerRunning
                              ? Icons.pause
                              : Icons.play_arrow,
                          size: 45.0,
                          color: const Color.fromARGB(255, 234, 98, 98),
                        ),
                        onPressed: toggleTimer,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          minimumSize: const Size(80, 80),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const SizedBox(width: 11),
                      ElevatedButton(
                        onPressed: () {
                          Provider.of<TimerLogic>(context, listen: false)
                              .addTime(300);
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          minimumSize: const Size(50, 50),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: const Text(
                          '+5',
                          style: TextStyle(
                            color: Color.fromARGB(255, 234, 98, 98),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
