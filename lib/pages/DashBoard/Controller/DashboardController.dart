import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class DashBoardController extends GetxController {
  final db = FirebaseFirestore.instance;
  RxInt userCount = 0.obs;
  RxInt totalProperty = 0.obs;
  RxInt totalPropertyRequest = 0.obs;
  RxInt totalPackerRequest = 0.obs;
  RxInt offers = 0.obs;
  RxInt totalSoldProperty = 0.obs;

  Stream<int> userCountStream() {
    return db
        .collection("Users")
        .where("Permission", isEqualTo: true)
        .snapshots()
        .map((snapshot) {
      if (kDebugMode) {
        print("UserCountStreaming");
        print(snapshot.docs.length);
      }
      return snapshot.docs.length;
    }).handleError((e) {
      if (kDebugMode) {
        print("Error streaming: $e");
      }
      return 0;
    });
  }

  Stream<int> getTotalProperty() {
    return db.collection("properties").snapshots().map((snapshot) {
      if (kDebugMode) {
        print("totalPropertyStreaming");
        print(snapshot.docs.length);
      }
      return snapshot.docs.length;
    }).handleError((e) {
      if (kDebugMode) {
        print("Error streaming: $e");
      }
      return 0;
    });
  }

  Stream<int> getTotalPropertyRequest() {
    return db.collection("propertyReq").snapshots().map((snapshot) {
      if (kDebugMode) {
        print("totalPropertyRequestStreaming");
        print(snapshot.docs.length);
      }
      return snapshot.docs.length;
    }).handleError((e) {
      if (kDebugMode) {
        print("Error streaming: $e");
      }
      return 0;
    });
  }

  Stream<int> gettotalPackerRequest() {
    return db.collection("PackersandMovers").snapshots().map((snapshot) {
      if (kDebugMode) {
        print("totalPackerRequestStreaming");
        print(snapshot.docs.length);
      }
      return snapshot.docs.length;
    }).handleError((e) {
      if (kDebugMode) {
        print("Error streaming: $e");
      }
      return 0;
    });
  }

  Stream<int> getOffers() {
    return db.collection("offers").snapshots().map((snapshot) {
      if (kDebugMode) {
        print("offersStreaming");
        print(snapshot.docs.length);
      }
      return snapshot.docs.length;
    }).handleError((e) {
      if (kDebugMode) {
        print("Error streaming: $e");
      }
      return 0;
    });
  }

  Stream<int> getTotalSoldProperty() {
    return db
        .collection("properties")
        .where("Sold", isEqualTo: "YES")
        .snapshots()
        .map((snapshot) {
      if (kDebugMode) {
        print("TotalSoldPropertyStreaming");
        print(snapshot.docs.length);
      }
      return snapshot.docs.length;
    }).handleError((e) {
      if (kDebugMode) {
        print("Error streaming: $e");
      }
      return 0;
    });
  }

  @override
  void onInit() {
    userCount.bindStream(userCountStream());
    totalProperty.bindStream(getTotalProperty());
    totalPropertyRequest.bindStream(getTotalPropertyRequest());
    totalPackerRequest.bindStream(gettotalPackerRequest());
    offers.bindStream(getOffers());
    totalSoldProperty.bindStream(getTotalSoldProperty());
    super.onInit();
  }

  @override
  void onClose() {
    userCount.close();
    totalProperty.close();
    totalPropertyRequest.close();
    totalPackerRequest.close();
    offers.close();
    totalSoldProperty.close();
    super.onClose();
  }
}
