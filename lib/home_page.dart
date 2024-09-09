import 'package:flutter/material.dart';
import 'package:flutter_animations/animations/animated_builder_and_transform.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return const AnimatedBuilderAndTransform();
                    },
                  ),
                );
              },
              child: const Text('Animated Builder & Tranform'),
            ),
          ],
        ),
      ),
    );
  }
}
