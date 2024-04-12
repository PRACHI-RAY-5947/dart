import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../utils/routes.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => StopwatchPageState();
}

class StopwatchPageState extends State<StopwatchPage> {
  DateTime _currentTime = DateTime.now();
  int hour = 0;
  int minute = 0;
  int second = 0;
  DateTime d = DateTime.now();
  bool isTimer = false;
  bool _isRunning = false;
  List<String> _flags = [];

  timer() {
    isTimer = true;
    Future.delayed(const Duration(microseconds: 5), () {
      setState(() {
        if (isTimer) {
          second++;
        }
        if (second > 59) {
          second = 0;
          minute++;
        }
        if (minute > 59) {
          minute = 0;
          hour++;
        }
        if (hour > 12) {
          hour = 0;
        }
      });
      if (isTimer) {
        timer();
      }
    });
  }

  void _addFlag() {
    setState(() {
      _flags.add(DateFormat.Hms().format(_currentTime));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).popAndPushNamed(MyRoutes.homePage);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Timer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: image
              ? DecorationImage(
                  image: NetworkImage(
                    bgImages[selectedImage],
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${hour.toString().padLeft(2, '0')} : ${minute.toString().padLeft(2, '0')} :${second.toString().padLeft(2, '0')} ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 70,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (!isTimer) {
                        timer();
                      }
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.not_started_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      isTimer = false;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.stop_circle_outlined,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      isTimer = false;
                      hour = minute = second = 0;
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _addFlag,
                child: const Text(
                  ("Flag"),
                ),
              ),
              const Text("Flags:"),
              Expanded(
                child: ListView.builder(
                    itemCount: _flags.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: const Icon(Icons.flag_circle_rounded),
                        title: Text(_flags[index]),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}