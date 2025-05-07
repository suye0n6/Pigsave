// 재사용 가능한 입력 필드
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const InputTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF666666),
            fontSize: 14,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w400,
            height: 1,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            border: Border.all(width: 1, color: const Color(0xFFB3B3B3)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 18,
              ),
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF999999),
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                height: 1,
                letterSpacing: -1,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
