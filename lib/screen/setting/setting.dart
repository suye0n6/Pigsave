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
                  SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      '설정',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Center(),
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
