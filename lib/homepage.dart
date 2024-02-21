import 'package:flutter/material.dart';
import 'package:nyacak22_app/customprogressbar.dart';
import 'package:nyacak22_app/sharedstate.dart';
import 'package:nyacak22_app/timer.dart';
import 'package:page_transition/page_transition.dart';

class HomePage1 extends StatelessWidget {
  const HomePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("HOME PAGE"),
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Timer1(), type: PageTransitionType.fade));
              },
              icon: const Icon(Icons.timer)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const SharedState1(),
                          type: PageTransitionType.leftToRight));
                },
                icon: const Icon(Icons.share)),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: const CustomProgress(),
                          type: PageTransitionType.fade));
                },
                icon: const Icon(Icons.bar_chart))
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/background1.png"),
                  fit: BoxFit.cover,
                  opacity: 230)),
        ),
      ),
    );
  }
}
