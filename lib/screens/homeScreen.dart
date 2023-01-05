import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalSec = 1500;
  int totalCount = 0;
  bool isRunning = false;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSec == 0) {
      setState(() {
        isRunning = !isRunning;
        totalCount = totalCount + 1;
        totalSec = 10;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSec = totalSec - 1;
      });
    }
  }

  void onClick() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = !isRunning;
    });
  }

  void onPause() {
    timer.cancel();
    setState(() {
      isRunning = !isRunning;
    });
  }

  String format(int sec) {
    var duration =
        Duration(seconds: sec).toString().split(".")[0].substring(2, 7);
    return duration;
  }

  void onReset() {
    onPause();
    setState(() {
      totalSec = 1500;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSec),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 80,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 150,
                    color: Theme.of(context).cardColor,
                    onPressed: isRunning ? onPause : onClick,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline_outlined
                        : Icons.play_circle_outlined),
                  ),
                  IconButton(
                    iconSize: 150,
                    color: Theme.of(context).cardColor,
                    onPressed: onReset,
                    icon: const Icon(Icons.refresh_outlined),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "pomodoro",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$totalCount",
                          style: TextStyle(
                            fontSize: 60,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
