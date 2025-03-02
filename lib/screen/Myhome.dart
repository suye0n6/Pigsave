import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigsave/screen/Home.dart';
import 'package:pigsave/screen/Pigfood.dart';
import 'package:pigsave/screen/setting.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, // 위에서부터 시작하도록
              children: [
                SizedBox(height: 40), // 앱바와 MyhomeTitle() 사이의 간격을 40px로 설정
                MyhomeTitle(),
                SizedBox(
                  height: 40,
                ), // MyhomeTitle()과 Myhomemain() 사이의 간격을 40px로 설정
                Myhomemain(),
                SizedBox(height: 200),
                Myhomelogout(),
              ],
            ),
          ),
          Positioned(
            bottom: 0, // 화면 하단에 Navbar를 고정
            left: 0,
            right: 0,
            child: SizedBox(
              child: Navbar(), // 하단 고정 Navbar
            ),
          ),
        ],
      ),
    );
  }
}

class MyhomeTitle extends StatefulWidget {
  const MyhomeTitle({super.key});

  @override
  State<MyhomeTitle> createState() => _MyhomeTitleState();
}

class _MyhomeTitleState extends State<MyhomeTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 34,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '김겸비',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.40,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(width: 19),
              Text(
                '로그아웃',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                  height: 1.40,
                  letterSpacing: -0.14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Myhomemain extends StatefulWidget {
  const Myhomemain({super.key});

  @override
  State<Myhomemain> createState() => _MyhomemainState();
}

class _MyhomemainState extends State<Myhomemain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 72,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                width: 5, // Width 설정
                strokeAlign: BorderSide.strokeAlignOutside, // strokeAlign 설정
                color: Color(0xFFE6E6E6),
              ),
              top: BorderSide(
                width: 5, // Width 설정
                strokeAlign: BorderSide.strokeAlignOutside, // strokeAlign 설정
                color: Color(0xFFE6E6E6),
              ),
              right: BorderSide(
                width: 5, // Width 설정
                strokeAlign: BorderSide.strokeAlignOutside, // strokeAlign 설정
                color: Color(0xFFE6E6E6),
              ),
              bottom: BorderSide(
                width: 5, // Width 설정
                strokeAlign: BorderSide.strokeAlignOutside, // strokeAlign 설정
                color: Color(0xFFE6E6E6),
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 16,
                top: 17,
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '현재 앱 버전',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1.20,
                          letterSpacing: -0.14,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '1.0.4',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                          height: 1.20,
                          letterSpacing: -0.14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 256,
                top: 26,
                child: Text(
                  '최신 버전입니다',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                    height: 1.40,
                    letterSpacing: -0.14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Myhomelogout extends StatefulWidget {
  const Myhomelogout({super.key});

  @override
  State<Myhomelogout> createState() => _MyhomelogoutState();
}

class _MyhomelogoutState extends State<Myhomelogout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF90000)),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '로그아웃',
            style: TextStyle(
              color: Color(0xFFF90000),
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w700,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 72,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 32,
                top: 4,
                child: Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Home Button
                      GestureDetector(
                        onTap: () {
                          // '홈' 클릭 시 HomePage로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: SvgPicture.asset(
                                  'assets/images/gite.svg',
                                  color: Color(0xFFB3B3B3),
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '홈',
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.20,
                                  letterSpacing: -0.14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                      // Feeding Button
                      GestureDetector(
                        onTap: () {
                          // '자동 급이' 클릭 시 FeedingPage로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Pigfood()),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: SvgPicture.asset(
                                  'assets/images/pig_nose.svg',
                                  color: Color(0xFFB3B3B3),
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '자동 급이',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.20,
                                  letterSpacing: -0.14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                      // Profile Button
                      GestureDetector(
                        onTap: () {
                          // '내 정보' 클릭 시 ProfilePage로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Myhome()),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: SvgPicture.asset(
                                  'assets/images/person.svg',
                                  color: Color(0xFFFE8295),
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '내 정보',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFE8295),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.20,
                                  letterSpacing: -0.14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 48),
                      // Settings Button
                      GestureDetector(
                        onTap: () {
                          // '설정' 클릭 시 SettingsPage로 이동
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SettingPage(),
                            ),
                          );
                        },
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(),
                                child: SvgPicture.asset(
                                  'assets/images/settings.svg',
                                  color: Color(0xFFB3B3B3),
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '설정',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFB3B3B3),
                                  fontSize: 14,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 1.20,
                                  letterSpacing: -0.14,
                                ),
                              ),
                            ],
                          ),
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
    );
  }
}
