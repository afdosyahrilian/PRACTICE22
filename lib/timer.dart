import 'dart:async';

import 'package:flutter/material.dart';

class Timer1 extends StatefulWidget {
  const Timer1({super.key});

  @override
  State<Timer1> createState() => _Timer1State();
}

class _Timer1State extends State<Timer1> {
  bool isStop = true;
  bool isBlack = true;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("TIMER"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counter.toString(),
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: (isBlack) ? Colors.black : Colors.blue),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Timer(Duration(seconds: 5), () {
                      setState(() {
                        isBlack = !isBlack;
                      });
                    });
                  },
                  child: Text("Ubah dalam 5 detik")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Timer.run(() {
                      setState(() {
                        isBlack = !isBlack;
                      });
                    });
                  },
                  child: const Text("Secara Langsung")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    counter = 0;
                    isStop = false;
                    Timer.periodic(Duration(seconds: 2), (timer) {
                      if (isStop) timer.cancel();
                      setState(() {
                        counter++;
                      });
                    });
                  },
                  child: Text("START TIMER")),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isStop = true;
                    });
                  },
                  child: const Text("STOP")),
            ],
          ),
        ),
      ),
    );
  }
}
