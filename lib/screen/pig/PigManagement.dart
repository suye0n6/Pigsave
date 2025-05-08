import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 14),
              Mantitle(uid: cardUid),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mantemp(temp: temp, tempState: tempState),
                  const SizedBox(width: 16),
                  Manheart(bpm: bpm, bpmState: bpmState),
                ],
              ),
              const SizedBox(height: 16),
              Manair(breath: breath, breathState: breathState),
              const SizedBox(height: 24),
            ],
          ),
        ),
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
            tempState ? '정상' : '비정상',
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
            bpmState ? '정상' : '비정상',
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
          Text(
            breathState ? '정상' : '비정상',
            style: TextStyle(
              color: breathState ? Color(0xFF12E143) : Colors.red,
              fontSize: 16,
            ),
          ),
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
