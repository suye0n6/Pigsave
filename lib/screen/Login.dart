import 'package:flutter/material.dart';
import 'package:pigsave/screen/LoginJoin.dart'; // 회원가입 화면 import
import 'package:pigsave/screen/Home.dart'; // 홈 화면 import

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 100),
                Logo(),
                SizedBox(height: 101),
                LoginBox(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 78,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            '돼지를 위한 나의 선택',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFE8295),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1.40,
              letterSpacing: -0.32,
            ),
          ),
          const SizedBox(height: 0),
          SizedBox(
            width: double.infinity,
            child: const Text(
              '돼지켜줄게',
              style: TextStyle(
                color: Color(0xFFFE8295),
                fontSize: 40,
                fontFamily: 'YOnepick',
                fontWeight: FontWeight.w700,
                height: 1.40,
                letterSpacing: -0.40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginBox extends StatefulWidget {
  const LoginBox({super.key});

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextField('이메일', '이메일을 입력해주세요'),
          const SizedBox(height: 10),
          _buildTextField('비밀번호', '비밀번호를 입력해주세요'),
          const SizedBox(height: 28),

          // 로그인 버튼
          GestureDetector(
            onTap: () {
              print('로그인 버튼 클릭');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    print('HomeScreen으로 이동');
                    return const HomeScreen(); // HomeScreen으로 이동
                  },
                ),
              );
            },
            child: Container(
              width: 328,
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                color: const Color(0xFFFE8295),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: Text(
                  '로그인하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w700,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 회원가입 이동
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '아직 회원이 아니시라면?',
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(width: 6),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('회원가입 클릭');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        print('LoginJoin 페이지로 이동');
                        return const LoginJoin();
                      },
                    ),
                  );
                },
                child: const Text(
                  '회원가입',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            border: Border.all(width: 1, color: const Color(0xFFB3B3B3)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            hintText,
            style: const TextStyle(
              color: Color(0xFF999999),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              height: 1,
              letterSpacing: -1,
            ),
          ),
        ),
      ],
    );
  }
}
