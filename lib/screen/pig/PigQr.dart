import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Pigtag extends StatefulWidget {
  const Pigtag({super.key});

  @override
  State<Pigtag> createState() => _PigtagState();
}

class _PigtagState extends State<Pigtag> {
  String _output = 'Empty Scan Code';
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Text(_output, style: TextStyle(color: Colors.black)),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _scan(),
          tooltip: 'scan',
          child: const Icon(Icons.camera_alt),
        ),
      ),
    );
  }

  Future _scan() async {
    try {
      String? barcode = await scanner.scan(); // barcode를 nullable로 변경
      if (barcode != null) {
        setState(() => _output = barcode);
      } else {
        setState(() => _output = '스캔 취소 또는 실패');
      }
    } catch (e) {
      setState(() => _output = '스캔 중 오류 발생: $e');
    }
  }
}
