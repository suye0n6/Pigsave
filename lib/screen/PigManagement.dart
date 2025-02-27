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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Stack의 경계를 벗어난 위젯을 잘리지 않도록 설정
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width / 2 - 177, // 중앙 정렬
            top: 100, // 적절히 올려서 위치 조정
            child: Manback(),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 16),
                  Mantitle(),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Mantemp(), SizedBox(width: 16), Manheart()],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Manmove(), SizedBox(width: 16), Manair()],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Manstress(), SizedBox(width: 16), Manempty()],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Manback extends StatefulWidget {
  const Manback({super.key});

  @override
  State<Manback> createState() => _ManbackState();
}

class _ManbackState extends State<Manback> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  // 새로운 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(), // NextPage()는 이동할 페이지
                    ),
                  );
                },
                child: Container(
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset('assets/images/arrow_left_alt.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
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
      barrierDismissible: true, // 배경을 클릭하면 닫히도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '돼지의 적정 온도는?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '38.5 ~ 39.5℃가 적정한 체온입니다.',
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w200,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 모달 창 닫기
                  },
                  child: Text('닫기'),
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
      barrierDismissible: true, // 배경을 클릭하면 닫히도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '돼지의 적정 심박수는?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '분당 70~120회입니다.',
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w200,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 모달 창 닫기
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Manmove extends StatefulWidget {
  const Manmove({super.key});

  @override
  State<Manmove> createState() => _ManmoveState();
}

class _ManmoveState extends State<Manmove> {
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
                      '활동량',
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
                      '부족',
                      style: TextStyle(
                        color: Color(0xFFF99900),
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
                            '21',
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
                            '걸음',
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
      barrierDismissible: true, // 배경을 클릭하면 닫히도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '돼지의 적정 활동량은?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '보통의 돼지 1000~3000보, 어미돈은 3000~5000보입니다.',
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w200,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 모달 창 닫기
                  },
                  child: Text('닫기'),
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
      barrierDismissible: true, // 배경을 클릭하면 닫히도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '돼지의 적정 분당 호흡수는?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '일반적으로 정상 환경조건에서 큰 돼지는 보통 분당 20회 정도, 작은 돼지는 분당 30~40회 정도가 입니다.',
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w200,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 모달 창 닫기
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Manstress extends StatefulWidget {
  const Manstress({super.key});

  @override
  State<Manstress> createState() => _ManstressState();
}

class _ManstressState extends State<Manstress> {
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
                      '스트레스',
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
                    Container(
                      width: double.infinity,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // 자식 크기를 최소화
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '안정적',
                            style: TextStyle(
                              color: Colors.black,
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
      barrierDismissible: true, // 배경을 클릭하면 닫히도록 설정
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          content: Container(
            width: 200,
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '돼지의 적정 스트레스 지수는?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '분당 70~120회입니다.',
                  style: TextStyle(
                    color: Color(0xFFB3B3B3),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w200,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 모달 창 닫기
                  },
                  child: Text('닫기'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Manempty extends StatefulWidget {
  const Manempty({super.key});

  @override
  State<Manempty> createState() => _ManemptyState();
}

class _ManemptyState extends State<Manempty> {
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
        ),
      ],
    );
  }
}
