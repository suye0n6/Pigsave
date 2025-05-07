import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  /// 로그인
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      print('로그인 오류: $e');
      return null;
    }
  }

  /// 로그아웃
  Future<void> signOut() async {
    await _auth.signOut();
  }

  /// 현재 로그인된 사용자 가져오기
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  /// 실시간 데이터 읽기 예시 (예: monitoring → 건강 정보)
  DatabaseReference get monitoringRef => _database.ref('monitoring');

  /// 실시간 데이터 읽기 예시 (예: food → 급이 정보)
  DatabaseReference get foodRef => _database.ref('food');
}
