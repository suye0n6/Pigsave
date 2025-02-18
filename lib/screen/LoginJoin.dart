import 'package:flutter/material.dart';

class LoginJoin extends StatefulWidget {
  const LoginJoin({super.key});

  @override
  State<LoginJoin> createState() => _LoginJoinState();
}

class _LoginJoinState extends State<LoginJoin> {
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
                Maintitle(),
                SizedBox(height: 40),
                MailCheck(),
                SizedBox(height: 44),
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
                                vertical: 18,
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
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '이메일을 입력해주세요',
                                    style: TextStyle(
                                      color: Color(0xFF999999),
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
                          const SizedBox(width: 6),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 18,
                            ),
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
                                  '인증번호 전송',
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), //여기를 16으로 하고 싶은데 16으로 하면 바텀 부족이 떠
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
                          '인증번호 확인',
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 18,
                      ),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF2F2F2),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                          borderRadius: BorderRadiusDirectional.circular(6),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '인증번호를 입력해주세요',
                            style: TextStyle(
                              color: Color(0xFF999999),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 18,
                      ),
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
                          Text(
                            '비밀번호를 입력해주세요',
                            style: TextStyle(
                              color: Color(0xFF999999),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 18,
                      ),
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
                          Text(
                            '비밀번호를 다시 입력해주세요',
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              height: 1,
                              letterSpacing: -1,
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
