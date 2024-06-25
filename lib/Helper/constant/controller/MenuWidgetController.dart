import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:quik_broker_admin/pages/Chat/view/ChatPage.dart';
import 'package:quik_broker_admin/pages/CustomerRequest/views/BuyRequest.dart';
import 'package:quik_broker_admin/pages/CustomerRequest/views/PackerRequest.dart';
import 'package:quik_broker_admin/pages/DashBoard/Views/DashBoard.dart';
import 'package:quik_broker_admin/pages/HouseManagement/view/HouseManagement.dart';
import 'package:quik_broker_admin/pages/Offer/view/OfferPage.dart';
import 'package:quik_broker_admin/pages/PushNotification/view/PushNotification.dart';
import 'package:quik_broker_admin/pages/User/view/UserPage.dart';

class MenuWidgetController extends GetxController {
  RxInt pageIndex = 0.obs;
  RxBool isexpanded = false.obs;
  changeIndex(RxInt val) {
    pageIndex.value = val.value;
  }

  void isexpandedwidget(RxBool val) {
    isexpanded.value = val.value;
  }

  RxList<dynamic> pages = [
    const DashBoard(),
    const BuyRequest(),
    const PackerRequest(),
    const HouseManagement(),
    UserPage(),
    const Offerpage(),
    const Pushnotification(),
    const Chatpage(),
  ].obs;
}
