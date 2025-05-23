import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:pigsave/screen/home/Home.dart';
import 'package:pigsave/screen/mypage/Myhome.dart';
import 'package:pigsave/screen/pig/Pigfoodchange.dart';
import 'package:pigsave/screen/setting/setting.dart';
import 'package:pigsave/widget/navbar.dart' as widget_navbar;

class Pigfood extends StatefulWidget {
  const Pigfood({super.key});

  @override
  State<Pigfood> createState() => _PigfoodState();
}

class _PigfoodState extends State<Pigfood> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      appBar: AppBar(backgroundColor: const Color(0xFFF2F2F2)),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(top: 0, right: 20, child: FoodTip()),
                      Positioned(
                        top: 70,
                        left: 0,
                        right: 0,
                        child: Center(child: FoodMain()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: widget_navbar.Navbar(),
          ),
        ],
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
  final DatabaseReference _foodRef = FirebaseDatabase.instance.ref('food');

  String cardUid = '';
  double foodAmount = 0.0;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _foodRef.onValue.listen((event) {
      final data = event.snapshot.value as Map?;
      if (data != null) {
        setState(() {
          cardUid = data['card_uid'] ?? '';
          foodAmount = (data['food'] as num?)?.toDouble() ?? 0.0;
          _controller.text = foodAmount.toStringAsFixed(1);
        });
      }
    });
  }

  void updateFoodAmount(double newAmount) async {
    await _foodRef.update({'food': newAmount, 'change_flag': 1});
    setState(() {
      foodAmount = newAmount;
      _controller.text = newAmount.toStringAsFixed(1);
    });
  }

  void _onSubmitted(String value) {
    final parsed = double.tryParse(value);
    if (parsed != null) {
      updateFoodAmount(parsed);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 189,
          height: 225,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 65,
                child: Column(
                  children: [
                    Text(
                      cardUid,
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.40,
                        letterSpacing: 0.16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${foodAmount.toStringAsFixed(1)}kg',
                          style: TextStyle(
                            color: Color(0xFFFE8295),
                            fontSize: 24,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.24,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '급여 중',
                          style: TextStyle(
                            color: Color(0xFFFE8295),
                            fontSize: 24,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            height: 1.40,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Container(
                height: 92,
                child: Column(
                  children: [
                    Container(
                      width: 157,
                      height: 36,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFB3B3B3)),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              final newAmount = (foodAmount - 0.1).clamp(
                                0.0,
                                100.0,
                              );
                              updateFoodAmount(
                                double.parse(newAmount.toStringAsFixed(1)),
                              );
                            },
                            child: Container(
                              width: 39,
                              height: 36,
                              child: SvgPicture.asset('assets/images/down.svg'),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(
                                  bottom: 17,
                                  left: 14,
                                ),
                              ),
                              style: TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.60,
                                letterSpacing: -0.32,
                              ),
                              onSubmitted: _onSubmitted,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                              bottom: 0,
                              right: 13,
                            ),
                            child: Text(
                              'kg',
                              style: TextStyle(
                                color: Color(0xFF1A1A1A),
                                fontSize: 16,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w400,
                                height: 1.60,
                                letterSpacing: -0.32,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              final newAmount = (foodAmount + 0.1).clamp(
                                0.0,
                                100.0,
                              );
                              updateFoodAmount(
                                double.parse(newAmount.toStringAsFixed(1)),
                              );
                            },
                            child: Container(
                              width: 36,
                              height: 36,
                              child: SvgPicture.asset('assets/images/up.svg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '+ & -나 직접 값을 입력하여\n급여량을 변경하세요(kg단위)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w400,
                        height: 1.60,
                        letterSpacing: -0.28,
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
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 28,
                  height: 28,
                  child: SvgPicture.asset('assets/images/info.svg'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
