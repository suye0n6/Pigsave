import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigsave/screen/mypage/Myhome.dart';
import 'package:pigsave/screen/pig/PigManagement.dart';
import 'package:pigsave/screen/pig/PigQr.dart';
import 'package:pigsave/screen/pig/Pigfood.dart';
import 'package:pigsave/screen/setting/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Stack(
        children: [
          // ✅ SafeArea 포함한 메인 내용
          Positioned.fill(
            child: SafeArea(
              child: Column(
                children: [
                  // 타이틀 영역 (왼쪽 정렬)
                  Padding(
                    padding: const EdgeInsets.only(top: 24, left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Hometitle(),
                    ),
                  ),
                  SizedBox(height: 32),

                  // 홈위젯 영역 (가운데 정렬)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Center(child: HomeWeidget()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ 하단 고정 Navbar
          Positioned(left: 0, right: 0, bottom: 0, child: Navbar()),
        ],
      ),
    );
  }
}

class Hometitle extends StatefulWidget {
  const Hometitle({super.key});

  @override
  State<Hometitle> createState() => _HometitleState();
}

class _HometitleState extends State<Hometitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 300,
          height: 34,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '은우 농장 1구역',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.40,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true, // 모달 높이 조절 가능
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return HomeFarmChangeModal(); // 새로운 모달 위젯
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFFE8295)),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: Text(
                    '변경',
                    style: TextStyle(
                      color: Color(0xFF4C4C4C),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      height: 1.40,
                      letterSpacing: -0.14,
                    ),
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

class HomeFarmChangeModal extends StatefulWidget {
  const HomeFarmChangeModal({super.key});

  @override
  State<HomeFarmChangeModal> createState() => _HomeFarmChangeModalState();
}

class _HomeFarmChangeModalState extends State<HomeFarmChangeModal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // 세로로 가운데 정렬
            crossAxisAlignment: CrossAxisAlignment.center, // 가로로 가운데 정렬
            children: [
              // ModalTitle 위젯을 상단에서 40px 떨어지게 배치
              SizedBox(height: 40),
              Center(child: ModalTitle()), // ModalTitle을 가운데 정렬
              // ModalWidget을 ModalTitle로부터 40px 떨어지게 배치
              SizedBox(height: 30),
              Center(child: ModalWidget()), // ModalWidget을 가운데 정렬
            ],
          ),
        ),
      ),
    );
  }
}

class ModalTitle extends StatefulWidget {
  const ModalTitle({super.key});

  @override
  State<ModalTitle> createState() => _ModalTitleState();
}

class _ModalTitleState extends State<ModalTitle> {
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
                '농장 변경',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                  height: 1.40,
                  letterSpacing: -0.24,
                ),
              ),
              const SizedBox(width: 208),
              Container(
                width: 32,
                height: 32,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // 페이지 닫기
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          child: SvgPicture.asset(
                            'assets/images/close.svg', // 로고 삽입
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

class ModalWidget extends StatefulWidget {
  const ModalWidget({super.key});

  @override
  State<ModalWidget> createState() => _ModalWidgetState();
}

class _ModalWidgetState extends State<ModalWidget> {
  int _selectedIndex = -1; // 선택된 컨테이너 인덱스

  void _onContainerTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 340,
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () => _onContainerTap(index),
                child: Container(
                  width: double.infinity,
                  height: 82,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.only(
                    top: 16,
                    left: 20,
                    right: 142,
                    bottom: 12,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color:
                        _selectedIndex == index
                            ? const Color(0xFFFE8295) // 선택 시 배경색 변경
                            : Colors.transparent, // 기본 배경색
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color:
                            _selectedIndex == index
                                ? Colors.transparent
                                : const Color(0xFFFE8295),
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '은우 농장 ${index + 1}구역',
                        style: TextStyle(
                          color:
                              _selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 20,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.40,
                          letterSpacing: -0.20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          SizedBox(
                            width: 16,
                            height: 16,
                            child: SvgPicture.asset(
                              'assets/images/location_on.svg',
                              color:
                                  _selectedIndex == index
                                      ? Colors.white
                                      : const Color(0xFFB4B4B4),
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '화성시 매송면 송라리 13-2',
                            style: TextStyle(
                              color:
                                  _selectedIndex == index
                                      ? Colors.white
                                      : const Color(0xFFB4B4B4),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w400,
                              height: 1.40,
                              letterSpacing: -0.14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class HomeWeidget extends StatefulWidget {
  const HomeWeidget({super.key});

  @override
  State<HomeWeidget> createState() => _HomeWeidgetState();
}

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _HomeWeidgetState extends State<HomeWeidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 291,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 96,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 24,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '현재 기준',
                                  style: TextStyle(
                                    color: Color(0xFF8C8C8C),
                                    fontSize: 14,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w400,
                                    height: 1.40,
                                    letterSpacing: -0.14,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '(12:24)',
                                  style: TextStyle(
                                    color: Color(0xFF8C8C8C),
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
                          Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '280',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.40,
                                    letterSpacing: -0.20,
                                  ),
                                ),
                                Text(
                                  '마리 급이 중',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w700,
                                    height: 1.40,
                                    letterSpacing: -0.20,
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 175,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 157,
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 48,
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
                                      '농장 태그',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40,
                                        letterSpacing: -0.20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      '농장 구역 설정',
                                      style: TextStyle(
                                        color: Color(0xFF8C8C8C),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.40,
                                        letterSpacing: -0.14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 48),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Pigtag(),
                                ),
                              );
                            },
                            child: Container(
                              width: 44,
                              height: 44,
                              child: SvgPicture.asset('assets/images/scan.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      width: 157,
                      height: 175,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 48,
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
                                      '모돈 관리',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w700,
                                        height: 1.40,
                                        letterSpacing: -0.20,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      '돼지 추가, 삭제',
                                      style: TextStyle(
                                        color: Color(0xFF8C8C8C),
                                        fontSize: 14,
                                        fontFamily: 'Pretendard',
                                        fontWeight: FontWeight.w400,
                                        height: 1.40,
                                        letterSpacing: -0.14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PigMange(),
                                ),
                              );
                            },
                            child: Container(
                              width: 60,
                              height: 47,
                              child: Stack(
                                children: [
                                  // Pignose 이미지를 먼저 배치
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 60,
                                      height: 47,
                                      child: SvgPicture.asset(
                                        'assets/images/Pignose.svg', // Pignose 이미지 경로
                                      ),
                                    ),
                                  ),
                                  // Pignose2 이미지를 그 위에 배치
                                  Positioned(
                                    left: 14.89,
                                    top: 18.29,
                                    child: Container(
                                      width: 30.82,
                                      height: 12.67,
                                      child: SvgPicture.asset(
                                        'assets/images/Pignose2.svg', // Pignose2 이미지 경로
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
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
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
                                ), // 로고 삽입
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '홈',
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
