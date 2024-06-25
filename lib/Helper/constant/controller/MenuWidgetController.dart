import 'package:get/get.dart';

class MenuWidgetController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxBool isexpanded = false.obs;
  changeIndex(RxInt val) {
    pageIndex.value = val.value;
  }

  void isexpandedwidget(RxBool val) {
    isexpanded.value = val.value;
  }
}
