import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigsave/screen/Home.dart';
import 'package:pigsave/screen/Myhome.dart';
import 'package:pigsave/screen/Pigfoodchange.dart';
import 'package:pigsave/screen/setting.dart';

class Pigfood extends StatefulWidget {
  const Pigfood({super.key});

  @override
  State<Pigfood> createState() => _PigfoodState();
}

class _PigfoodState extends State<Pigfood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(top: 0, right: 20, child: FoodTip()),

                  Positioned(
                    top: 70, // This positions FoodMain 32px below FoodButton
                    left: 0,
                    right: 0,
                    child: Center(child: FoodMain()),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: SizedBox(child: Navbar()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodMain extends StatefulWidget {
  const FoodMain({super.key});

  @override
  State<FoodMain> createState() => _FoodMainState();
}

class _FoodMainState extends State<FoodMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 189,
          height: 220,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 60,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'P372837',
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: 0.16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '3.2kg',
                            style: TextStyle(
                              color: Color(0xFFFE8295),
                              fontSize: 24,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.40,
                              letterSpacing: -0.24,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '급여 중',
                            style: TextStyle(
                              color: Color(0xFFFE8295),
                              fontSize: 24,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
                              height: 1.40,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Container(
                height: 92,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 157,
                      height: 36,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 121,
                            top: 0,
                            child: Container(
                              width: 36,
                              height: 36,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    width: 1,
                                    color: Color(0xFFB3B3B3),
                                  ),
                                  top: BorderSide(color: Color(0xFFB3B3B3)),
                                  right: BorderSide(color: Color(0xFFB3B3B3)),
                                  bottom: BorderSide(color: Color(0xFFB3B3B3)),
                                ),
                              ),
                              child: SvgPicture.asset('assets/images/up.svg'),
                            ),
                          ),
                          Positioned(
                            left: 59,
                            top: 5,
                            child: Container(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '3.2',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.60,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                  Text(
                                    'kg',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF1A1A1A),
                                      fontSize: 16,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w400,
                                      height: 1.60,
                                      letterSpacing: -0.32,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 39,
                              height: 36,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Color(0xFFB3B3B3)),
                                  top: BorderSide(color: Color(0xFFB3B3B3)),
                                  right: BorderSide(
                                    width: 1,
                                    color: Color(0xFFB3B3B3),
                                  ),
                                  bottom: BorderSide(color: Color(0xFFB3B3B3)),
                                ),
                              ),
                              child: SvgPicture.asset('assets/images/down.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          '+&-나 직접 값을 입력하여\n급여량을 변경하세요(kg단위)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            height: 1.60,
                            letterSpacing: -0.28,
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
    );
  }
}

class FoodTip extends StatefulWidget {
  const FoodTip({super.key});

  @override
  State<FoodTip> createState() => _FoodTipState();
}

class _FoodTipState extends State<FoodTip> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset('assets/images/info.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
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
                                  color: Color(0xFFFE8295),
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '자동 급이',
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
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '내 정보',
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
