import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pigsave/controller/navbar_controller.dart';
import 'package:pigsave/screen/home/Home.dart';
import 'package:pigsave/screen/Pig/Pigfood.dart';
import 'package:pigsave/screen/setting/setting.dart';
import 'package:pigsave/screen/mypage/MyHome.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();

    return Container(
      width: 360,
      height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _navItem(
            iconPath: 'assets/images/gite.svg',
            label: '홈',
            isSelected: navController.currentIndex.value == 0,
            onTap: () {
              navController.changePage(0);
              Get.to(() => HomeScreen());
            },
          ),
          _navItem(
            iconPath: 'assets/images/pig_nose.svg',
            label: '자동 급이',
            isSelected: navController.currentIndex.value == 1,
            onTap: () {
              navController.changePage(1);
              Get.to(() => Pigfood());
            },
          ),
          _navItem(
            iconPath: 'assets/images/person.svg',
            label: '내 정보',
            isSelected: navController.currentIndex.value == 2,
            onTap: () {
              navController.changePage(2);
              Get.to(() => Myhome());
            },
          ),
          _navItem(
            iconPath: 'assets/images/settings.svg',
            label: '설정',
            isSelected: navController.currentIndex.value == 3,
            onTap: () {
              navController.changePage(3);
              Get.to(() => SettingPage());
            },
          ),
        ],
      ),
    );
  }

  Widget _navItem({
    required String iconPath,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 30,
            height: 30,
            color: isSelected ? Color(0xFFFE8295) : Color(0xFFB3B3B3),
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Color(0xFFFE8295) : Color(0xFFB3B3B3),
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
