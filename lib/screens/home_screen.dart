import 'package:flutter/material.dart';

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
              child: Container(
                alignment: Alignment.center,
                child: Container(
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
                    )),
              ),
            ),
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 234, 98, 98),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Enabled'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Enabled'),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('Enabled'),
                      ),
                    ],
                  )),
            ),
          ]),
    );
  }
}
