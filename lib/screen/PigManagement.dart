import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PigMange extends StatefulWidget {
  const PigMange({super.key});

  @override
  State<PigMange> createState() => _PigMangeState();
}

class _PigMangeState extends State<PigMange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Mantitle(),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mantemp(),
                  SizedBox(width: 16), // Mantemp와 Manheart 사이에 16px 간격 추가
                  Manheart(),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Manmove(), SizedBox(width: 16), Manair()],
              ),
              SizedBox(height: 16), // Manmove와 Manair 사이에 16px 간격 추가
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Manstress(), SizedBox(width: 16), Manempty()],
              ),
              // Manmove 바로 아래에 Manstress 배치
            ],
          ),
        ),
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
              Container(
                width: 28,
                height: 28,
                child: SvgPicture.asset('assets/images/arrow_left_alt.svg'),
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
                      child: SizedBox(
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
                    ),
                    SizedBox(
                      width: 168,
                      child: SizedBox(
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
                    ),
                  ],
                ),
              ),
              Container(
                width: 32,
                height: 32,
                child: SvgPicture.asset('assets/images/scan.svg'),
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
              Container(
                width: 153,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/images/info.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 81,
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
                      width: 81,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
              Container(
                width: 153,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/images/info.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 81,
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
                      width: 81,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
                            'bpm',
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
              Container(
                width: 153,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/images/info.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 81,
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
                      width: 81,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
              Container(
                width: 153,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/images/info.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 81,
                height: 58,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '위험',
                      style: TextStyle(
                        color: Color(0xFFF90000),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: 0.16,
                      ),
                    ),
                    Container(
                      width: 81,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '5',
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
              Container(
                width: 153,
                height: 24,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                    Container(
                      width: 24,
                      height: 24,
                      child: Stack(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset('assets/images/info.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 81,
                height: 58,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 81,
                      height: 32,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
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
