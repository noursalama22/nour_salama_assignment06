import 'package:flutter/material.dart';
import 'package:nour_salama_assignment06/screen/play_screen.dart';

void main() {
  runApp(RpsGame());
}

class RpsGame extends StatelessWidget {
  const RpsGame({Key? key}) : super(key: key);

  // void calculateResult
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PlayScreen(),
    );
  }
}
