import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigsave/screen/home/Home.dart';
import 'package:pigsave/screen/qr/Login.dart';
import 'package:pigsave/screen/pig/Pigfood.dart';
import 'package:pigsave/screen/setting/setting.dart';
import 'package:pigsave/widget/navbar.dart' as widget_navbar;

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
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
            child: widget_navbar.Navbar(),
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Container(
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
      ),
    );
  }
}
