import 'dart:math';

import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(animationController);
    animationController.repeat();
  }


  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child){
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(animation.value),
              child: Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5.0,
                          blurRadius: 7.0,
                          offset: const Offset(0, 3)
                      )
                    ]
                ),
              ),
            );
          },
        )
      ),
    );
  }
}
