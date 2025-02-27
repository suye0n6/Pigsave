import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Pigfood extends StatefulWidget {
  const Pigfood({super.key});

  @override
  State<Pigfood> createState() => _PigfoodState();
}

class _PigfoodState extends State<Pigfood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 16), // ✅ 왼쪽에 16px 여백 추가
              //child: Hometitle(), // 🟢 태그 인식 컨테이너
            ),
            SizedBox(height: 32),
            Expanded(
              // ✅ 빈 공간을 차지하여 overflow 방지
              // 홈 바텀 위젯 오버플로우 수정
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center, // 세로로 중앙 정렬
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center, // 가로로 중앙 정렬
                          children: [
                            Align(
                              alignment:
                                  Alignment.center, // FoodButton을 수직 중앙에 배치
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 0,
                                  bottom: 2,
                                ), // FoodButton의 세세한 위치 조정 (위로 2픽셀 만큼 올라감)
                                child: FoodButton(),
                              ),
                            ),
                            SizedBox(width: 16), // 버튼과 팁 사이에 간격을 두기 위한 SizedBox
                            Align(
                              alignment: Alignment.center, // FoodTip을 수직 중앙에 배치
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 4,
                                ), // FoodTip을 세세하게 조정 (위로 4픽셀 만큼 내려감)
                                child: FoodTip(),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                        ), // 버튼과 팁 아래에 32px 간격을 두기 위한 SizedBox
                        FoodMain(), // 메인 콘텐츠
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0, // 화면의 하단에 고정
                    left: 0,
                    right: 0, // 가로로 꽉 차게
                    child: SizedBox(
                      child: Navbar(), // 하단 고정 Navbar
                    ),
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
          width: 328,
          height: 74,
          padding: const EdgeInsets.only(bottom: 16), // 이 부분에서 오류가 나지 않도록 수정
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xFFE6E6E6)),
              top: BorderSide(color: Color(0xFFE6E6E6)),
              right: BorderSide(color: Color(0xFFE6E6E6)),
              bottom: BorderSide(width: 1, color: Color(0xFFE6E6E6)),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 124,
                height: 58,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '하루 급여량(한 마리당)',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: -0.14,
                      ),
                    ),
                    Text(
                      '3.2kg',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
                        fontSize: 32,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: 0.32,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 88,
                height: 36,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFFE8295)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '급여량 변경',
                      style: TextStyle(
                        color: Color(0xFFFE8295),
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
          ),
        ),
      ],
    );
  }
}

class FoodButton extends StatefulWidget {
  const FoodButton({super.key});

  @override
  State<FoodButton> createState() => _FoodButtonState();
}

class _FoodButtonState extends State<FoodButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 180,
          height: 36,
          padding: const EdgeInsets.all(4),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 84,
                height: 28,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFFE8295),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '일괄 급여',
                      style: TextStyle(
                        color: Colors.white,
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
                width: 84,
                height: 28,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '특별 급여',
                      style: TextStyle(
                        color: Color(0xFF1A1A1A),
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
              Container(
                width: 28,
                height: 28,
                child: SvgPicture.asset('assets/images/info.svg'),
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
                      Container(
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
                              ), //로고 삽입
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
                      const SizedBox(width: 48),
                      Container(
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
                              ), //로고 삽입
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
                      const SizedBox(width: 48),
                      Container(
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
                              ), //로고 삽입
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
                      const SizedBox(width: 48),
                      Container(
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
                              ), //로고 삽입
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
