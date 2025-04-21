import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screen/Login.dart'; // Login 화면 import 및 클릭 이벤트 구현
import 'firebase_options.dart'; // Firebase 옵션 파일 임포트
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // Firebase 초기화 코드
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions
            .currentPlatform, // firebase_options.dart에서 옵션 가져오기
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Control(), // 첫 화면을 Control 페이지로 설정
      debugShowCheckedModeBanner: false,
    );
  }
}

class Control extends StatefulWidget {
  const Control({super.key});

  @override
  State<Control> createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  void initState() {
    super.initState();

    // 화면이 완전히 빌드된 후에 LoginScreen으로 이동 후 슬로우 걸기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Loading...'), // 화면 전환 전 로딩 표시
      ),
    );
  }
}
