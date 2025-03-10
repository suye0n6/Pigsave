import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginJoin extends StatefulWidget {
  const LoginJoin({super.key});

  @override
  State<LoginJoin> createState() => _LoginJoinState();
}

class _LoginJoinState extends State<LoginJoin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(
        toolbarHeight: 29,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // 뒤로가기 아이콘
          onPressed: () {
            Navigator.pop(context); // 이전 페이지로 이동
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Maintitle(),
                SizedBox(height: 50),
                MailCheck(),
                SizedBox(height: 6),
                Rightcheck(),
                SizedBox(height: 24),
                PasswordCheck(),
                SizedBox(height: 56),
                JoinButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Maintitle extends StatefulWidget {
  const Maintitle({super.key});

  @override
  State<Maintitle> createState() => _MaintitleState();
}

class _MaintitleState extends State<Maintitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '회원가입',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 1.40,
            letterSpacing: -0.36,
          ),
        ),
      ],
    );
  }
}

class MailCheck extends StatefulWidget {
  const MailCheck({super.key});

  @override
  State<MailCheck> createState() => _MailCheckState();
}

class _MailCheckState extends State<MailCheck> {
  final TextEditingController _emailController =
      TextEditingController(); // _emailController 선언
  final FirebaseAuth _auth = FirebaseAuth.instance; // FirebaseAuth 객체 선언

  @override
  void dispose() {
    _emailController.dispose(); // 메모리 관리
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  '이메일',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 51,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical:
                              0, // vertical padding을 0으로 설정 (TextField와 중복 방지)
                        ),
                        decoration: ShapeDecoration(
                          color: Color(0xFFF2F2F2),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: Color(0xFFB3B3B3),
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft, // 힌트 정렬 문제 해결
                          child: TextField(
                            controller: _emailController,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: '이메일을 입력해주세요',
                              hintStyle: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                letterSpacing: -1,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero, // 중복 패딩 제거
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                            ),
                            textAlign: TextAlign.start,
                            scrollPhysics: ClampingScrollPhysics(),
                            textInputAction: TextInputAction.done,
                            keyboardAppearance: Brightness.light,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () async {
                        try {
                          // 이메일 인증 코드
                          UserCredential userCredential = await _auth
                              .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: "임시비밀번호123!", // 비밀번호 설정
                              );

                          User? user = userCredential.user;
                          if (user != null && !user.emailVerified) {
                            await user.sendEmailVerification();
                            print("인증 이메일을 전송했습니다.");
                          }
                        } catch (e) {
                          print("오류 발생: $e");
                        }
                      },
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 18,
                        ),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFE8295),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '인증메일 전송',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1,
                                letterSpacing: -1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Rightcheck extends StatefulWidget {
  const Rightcheck({super.key});

  @override
  State<Rightcheck> createState() => _RightcheckState();
}

class _RightcheckState extends State<Rightcheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30),
        Text(
          '인증을 진행해주세요',
          style: TextStyle(
            color: Color(0xFF666666),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: -1,
          ),
        ),
      ],
    );
  }
}

class PasswordCheck extends StatefulWidget {
  const PasswordCheck({super.key});

  @override
  State<PasswordCheck> createState() => _PasswordCheckState();
}

class _PasswordCheckState extends State<PasswordCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 160,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 72,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          '비밀번호',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: double.infinity,

                      decoration: ShapeDecoration(
                        color: Color(0xFFF2F2F2),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '비밀번호를 입력해주세요',
                                hintStyle: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: -1,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 72,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          '비밀번호 확인',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1,
                            letterSpacing: -1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF2F2F2),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: '비밀번호를 다시 입력해주세요',
                                hintStyle: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                  letterSpacing: -1,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class JoinButton extends StatefulWidget {
  const JoinButton({super.key});

  @override
  State<JoinButton> createState() => _JoinButtonState();
}

class _JoinButtonState extends State<JoinButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
          decoration: ShapeDecoration(
            color: Color(0xFFFE8295),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '회원가입',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
