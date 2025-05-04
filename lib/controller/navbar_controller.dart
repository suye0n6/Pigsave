import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 3.obs; // 설정 페이지가 3번 인덱스라고 가정

  void changePage(int index) {
    currentIndex.value = index;
  }
}
