import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimatedBuilderAndTransform extends StatefulWidget {
  const AnimatedBuilderAndTransform({super.key});

  @override
  State<AnimatedBuilderAndTransform> createState() => _AnimatedBuilderAndTransformState();
}

class _AnimatedBuilderAndTransformState extends State<AnimatedBuilderAndTransform> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();

    // Create an animation that goes from 0 to 2 * pi (a full rotation)
    _animation = Tween<double>(begin: 0, end: 2 * pi).animate(_animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                // Apply a rotation transform to the child based on the current value of the animation
                return Transform(
                  // Set the alignment of the child to the center
                  // You can set what ever suits you it's like the pivot point of the rotation
                  alignment: Alignment.center,
                  // Rotate the child by the current value of the animation
                  transform: Matrix4.identity()..rotateZ(_animation.value),
                  child: child,
                );
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
