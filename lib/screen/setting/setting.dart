import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pigsave/controller/navbar_controller.dart';
import 'package:pigsave/widget/navbar.dart' as widget_navbar;
import 'package:pigsave/screen/home/Home.dart';
import 'package:pigsave/screen/mypage/Myhome.dart';
import 'package:pigsave/screen/pig/Pigfood.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
      body: Stack(
        children: [
          Positioned.fill(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 0,
                          left: 20,
                          top: 0,
                        ),
                        child: options(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: widget_navbar.Navbar(),
          ),
        ],
      ),
    );
  }
}

class options extends StatelessWidget {
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
            spacing: 12,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/lock.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '비밀번호 변경',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/notifications.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '알림',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/distance.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '위치 정보',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/broken_image.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '화면',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.36,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 4,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: SvgPicture.asset(
                        'assets/images/more_horiz.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      '기타',
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 18,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                        height: 1.40,
                        letterSpacing: -0.36,
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
