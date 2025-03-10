import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pigsave/screen/Home.dart';
import 'package:pigsave/screen/PigQr.dart';

class PigMange extends StatefulWidget {
  const PigMange({super.key});

  @override
  State<PigMange> createState() => _PigMangeState();
}

class _PigMangeState extends State<PigMange> {
  GlobalKey _mantempKey = GlobalKey();
  double _mantempWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Mantitle은 AppBar 아래 14px만큼 떨어져 배치
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Mantitle(),
                ),
              ],
            ),
          ),
          // Mantemp는 Mantitle 아래에 14px 만큼 떨어져 배치
          Positioned(
            top: 14 + 56 + 20, // 14px padding + AppBar 높이 (56px) + 14px 공간
            left: 30, // Mantemp는 화면 왼쪽에 배치
            child: SizedBox(
              key: _mantempKey, // Mantemp에 GlobalKey를 적용
              child: Mantemp(),
            ),
          ),
          // Manheart는 Mantemp의 오른쪽에 16px 만큼 떨어져 배치
          Positioned(
            top: 14 + 56 + 20, // Mantemp와 동일한 위치
            left: _mantempWidth + 205, // Mantemp의 오른쪽으로 16px 만큼 떨어져 배치
            child: SizedBox(child: Manheart()),
          ),
          Positioned(
            top: 14 + 56 + 180, // Mantemp와 동일한 위치
            left: 30, // Mantemp의 오른쪽으로 16px 만큼 떨어져 배치
            child: SizedBox(child: Manair()),
          ),
        ],
      ),
    );
  }
}

class Mantitle extends StatefulWidget {
  const Mantitle({super.key});

  @override
  State<Mantitle> createState() => _MantitleState();
}

class _MantitleState extends State<Mantitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 328,
          height: 52,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 168,
                height: 52,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 168,
                      child: Text(
                        '모돈',
                        style: TextStyle(
                          color: Color(0xFF8C8C8C),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                          height: 1,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 168,
                      child: Text(
                        'P381931',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w700,
                          height: 1.40,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // 스캔 버튼을 클릭하면 다른 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Pigtag(), // ScanPage()는 이동할 페이지
                    ),
                  );
                },
                child: Container(
                  width: 32,
                  height: 32,
                  child: SvgPicture.asset('assets/images/scan.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Mantemp extends StatefulWidget {
  const Mantemp({super.key});

  @override
  State<Mantemp> createState() => _MantempState();
}

class _MantempState extends State<Mantemp> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 157,
          height: 132,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 16,
            left: 12,
            right: 12,
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
              // Row에서 Text와 아이콘이 크기를 적절히 가질 수 있도록 수정
              Container(
                width: double.infinity,
                height: 24,
                child: Row(
                  mainAxisSize:
                      MainAxisSize.max, // MainAxisSize.max로 설정하여 크기 조정
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '체온',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: -1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 사진 클릭 시 모달 창 띄우기
                        _showInfoDialog(context);
                      },
                      child: Container(
                        width: 24, // 명시적인 크기 지정
                        height: 24, // 명시적인 크기 지정
                        child: SvgPicture.asset('assets/images/info.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              // 텍스트와 온도가 표시된 Container
              Container(
                width: double.infinity,
                height: 58,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '적절',
                      style: TextStyle(
                        color: Color(0xFF12E143),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: 0.16,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // 자식 크기를 최소화
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '32.8',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1,
                              letterSpacing: 0.32,
                            ),
                          ),
                          Text(
                            '°',
                            style: TextStyle(
                              color: Color(0xFFB3B3B3),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
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

  // 모달 창을 띄우는 함수
  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 151,
            height: 237,
            padding: const EdgeInsets.only(
              top: 20,
              left: 12,
              right: 12,
              bottom: 14,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 138,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '돼지의 적정 체온은?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '38.5 ~ 39.5℃가 적정한 체온입니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
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
                const SizedBox(height: 32),
                Container(
                  width: 171,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // "닫기" 버튼 클릭 시 다이얼로그 닫기
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 8,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE6E6E6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 28,
                                  child: Text(
                                    '닫기',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                      height: 1.20,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}

class Manheart extends StatefulWidget {
  const Manheart({super.key});

  @override
  State<Manheart> createState() => _ManheartState();
}

class _ManheartState extends State<Manheart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 157,
          height: 132,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 16,
            left: 12,
            right: 12,
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
              // Row에서 Text와 아이콘이 크기를 적절히 가질 수 있도록 수정
              Container(
                width: double.infinity,
                height: 24,
                child: Row(
                  mainAxisSize:
                      MainAxisSize.max, // MainAxisSize.max로 설정하여 크기 조정
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '심박수',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: -1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 사진 클릭 시 모달 창 띄우기
                        _showInfoDialog(context);
                      },
                      child: Container(
                        width: 24, // 명시적인 크기 지정
                        height: 24, // 명시적인 크기 지정
                        child: SvgPicture.asset('assets/images/info.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              // 텍스트와 온도가 표시된 Container
              Container(
                width: double.infinity,
                height: 58,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '적절',
                      style: TextStyle(
                        color: Color(0xFF12E143),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: 0.16,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // 자식 크기를 최소화
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '80',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1,
                              letterSpacing: 0.32,
                            ),
                          ),
                          Text(
                            '회',
                            style: TextStyle(
                              color: Color(0xFFB3B3B3),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
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

  // 모달 창을 띄우는 함수
  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 195,
            height: 237,
            padding: const EdgeInsets.only(
              top: 20,
              left: 12,
              right: 12,
              bottom: 14,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 138,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '돼지의 적정 심박수는?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '분당 70 - 120회 입니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
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
                const SizedBox(height: 32),
                Container(
                  width: 171,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // "닫기" 버튼 클릭 시 다이얼로그 닫기
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 8,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE6E6E6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 28,
                                  child: Text(
                                    '닫기',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                      height: 1.20,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}

class Manair extends StatefulWidget {
  const Manair({super.key});

  @override
  State<Manair> createState() => _ManairState();
}

class _ManairState extends State<Manair> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 157,
          height: 132,
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 16,
            left: 12,
            right: 12,
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
              // Row에서 Text와 아이콘이 크기를 적절히 가질 수 있도록 수정
              Container(
                width: double.infinity,
                height: 24,
                child: Row(
                  mainAxisSize:
                      MainAxisSize.max, // MainAxisSize.max로 설정하여 크기 조정
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '분당 호흡수',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1,
                        letterSpacing: -1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // 사진 클릭 시 모달 창 띄우기
                        _showInfoDialog(context);
                      },
                      child: Container(
                        width: 24, // 명시적인 크기 지정
                        height: 24, // 명시적인 크기 지정
                        child: SvgPicture.asset('assets/images/info.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              // 텍스트와 온도가 표시된 Container
              Container(
                width: double.infinity,
                height: 58,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '정상',
                      style: TextStyle(
                        color: Color(0xFF1BD446),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: 0.16,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // 자식 크기를 최소화
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '16',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                              height: 1,
                              letterSpacing: 0.32,
                            ),
                          ),
                          Text(
                            '회',
                            style: TextStyle(
                              color: Color(0xFFB3B3B3),
                              fontSize: 16,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w700,
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

  // 모달 창을 띄우는 함수
  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            width: 195,
            height: 237,
            padding: const EdgeInsets.only(
              top: 20,
              left: 12,
              right: 12,
              bottom: 14,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  height: 138,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '돼지의 적정 분당 호흡수는?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 18,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 45),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          '일반적으로 정상 환경조건에서 큰 돼지는 보통 분당 20회 정도, 작은 돼지는 분당 30~40회 정도가 입니다.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF7F7F7F),
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
                const SizedBox(height: 32),
                Container(
                  width: 171,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // "닫기" 버튼 클릭 시 다이얼로그 닫기
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 8,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE6E6E6),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 28,
                                  child: Text(
                                    '닫기',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF666666),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w600,
                                      height: 1.20,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                ),
                              ],
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
        );
      },
    );
  }
}
