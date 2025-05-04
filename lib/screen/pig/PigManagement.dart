import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pigsave/screen/home/Home.dart';
import 'package:pigsave/screen/pig/PigQr.dart';

class PigMange extends StatefulWidget {
  const PigMange({super.key});

  @override
  State<PigMange> createState() => _PigMangeState();
}

class _PigMangeState extends State<PigMange> {
  final DatabaseReference _monitoringRef = FirebaseDatabase.instance.ref(
    'monitoring',
  );

  String cardUid = '';
  double temp = 0;
  int bpm = 0;
  int breath = 0;
  bool tempState = true;
  bool bpmState = true;
  bool breathState = true;

  @override
  void initState() {
    super.initState();
    _monitoringRef.onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          cardUid = data['card_uid'] ?? '';
          temp = (data['temp'] as num?)?.toDouble() ?? 0.0;
          bpm = (data['bpm'] as num?)?.toInt() ?? 0;
          breath = (data['breath'] as num?)?.toInt() ?? 0;
          tempState = data['temp_state'] ?? true;
          bpmState = data['bpm_state'] ?? true;
          breathState = data['breath_state'] ?? true;
        });
      }
    });
  }

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
                Padding(
                  padding: const EdgeInsets.only(top: 14),
                  child: Mantitle(uid: cardUid),
                ),
              ],
            ),
          ),
          Positioned(
            top: 14 + 56 + 20,
            left: 30,
            child: Mantemp(temp: temp, tempState: tempState),
          ),
          Positioned(
            top: 14 + 56 + 20,
            left: 30 + 157 + 16,
            child: Manheart(bpm: bpm, bpmState: bpmState),
          ),
          Positioned(
            top: 14 + 56 + 180,
            left: 30,
            child: Manair(breath: breath, breathState: breathState),
          ),
        ],
      ),
    );
  }
}

class Mantitle extends StatelessWidget {
  final String uid;
  const Mantitle({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 55,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '모돈',
                style: TextStyle(
                  color: Color(0xFF8C8C8C),
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                ),
              ),
              Text(
                uid,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pigtag()),
              );
            },
            child: SvgPicture.asset(
              'assets/images/scan.svg',
              width: 32,
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}

class Mantemp extends StatelessWidget {
  final double temp;
  final bool tempState;
  const Mantemp({super.key, required this.temp, required this.tempState});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 132,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '체온',
                style: TextStyle(fontSize: 14, fontFamily: 'Pretendard'),
              ),
              GestureDetector(
                onTap: () => _showInfoDialog(context),
                child: SvgPicture.asset(
                  'assets/images/info.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          Text(
            tempState ? '적절' : '비정상',
            style: TextStyle(
              color: tempState ? Color(0xFF12E143) : Colors.red,
              fontSize: 16,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                temp.toStringAsFixed(1),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                '°',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB3B3B3),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Text(
              '38.5 ~ 39.5℃가 적정한 체온입니다.',
              textAlign: TextAlign.center,
            ),
          ),
    );
  }
}

class Manheart extends StatelessWidget {
  final int bpm;
  final bool bpmState;
  const Manheart({super.key, required this.bpm, required this.bpmState});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 132,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '심박수',
                style: TextStyle(fontSize: 14, fontFamily: 'Pretendard'),
              ),
              GestureDetector(
                onTap: () => _showInfoDialog(context),
                child: SvgPicture.asset(
                  'assets/images/info.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          Text(
            bpmState ? '적절' : '비정상',
            style: TextStyle(
              color: bpmState ? Color(0xFF12E143) : Colors.red,
              fontSize: 16,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                bpm.toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                '회',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB3B3B3),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Text(
              '분당 70 - 120회가 적정 심박수입니다.',
              textAlign: TextAlign.center,
            ),
          ),
    );
  }
}

class Manair extends StatelessWidget {
  final int breath;
  final bool breathState;
  const Manair({super.key, required this.breath, required this.breathState});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 132,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '분당 호흡수',
                style: TextStyle(fontSize: 14, fontFamily: 'Pretendard'),
              ),
              GestureDetector(
                onTap: () => _showInfoDialog(context),
                child: SvgPicture.asset(
                  'assets/images/info.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
          Text('정상', style: TextStyle(color: Color(0xFF1BD446), fontSize: 16)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                breath.toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              Text(
                '회',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFB3B3B3),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: Text(
              '성체 돼지는 분당 20회, 자돈은 30~40회가 적정 호흡수입니다.',
              textAlign: TextAlign.center,
            ),
          ),
    );
  }
}

// 모달 창을 띄우는 함수
void _showInfoDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
