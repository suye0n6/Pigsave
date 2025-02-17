import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('홈 화면')),
      body: const Center(
        child: Text('여기가 홈 화면입니다!', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
