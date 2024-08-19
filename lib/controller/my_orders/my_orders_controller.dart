import 'package:get/get.dart';
import 'package:shop_app_mobile/model/response/completed_order.dart';

class MyOrdersController extends GetxController {
  List ongoingOrders = [];
  RxList<CompletedOrder> completedOrders = <CompletedOrder>[].obs;

  Future<void> getOngoingOrders() async {}

  Future<void> getCompletedOrders() async {
    await Future.delayed(const Duration(seconds: 1), () {
      completedOrders.value = [
        CompletedOrder(
            name: "Regular Fit Slogan",
            size: "L",
            price: 1400.0,
            status: "Completed",
            image: "assets/images/image-big-1.png"),
        CompletedOrder(
            name: "Regular Fit Polo",
            size: "M",
            price: 850.0,
            status: "Completed",
            image: "assets/images/image-big-2.png"),
        CompletedOrder(
            name: "Regular Fit Slogan",
            size: "L",
            price: 1400.0,
            status: "Completed",
            image: "assets/images/image-big-4.png"),
        CompletedOrder(
            name: "Regular Fit Polo",
            size: "M",
            price: 850.0,
            status: "Completed",
            image: "assets/images/image-big-3.png"),
        CompletedOrder(
            name: "Regular Fit Slogan",
            size: "L",
            price: 1400.0,
            status: "Completed",
            image: "assets/images/image-big-2.png"),
        CompletedOrder(
            name: "Regular Fit Polo",
            size: "M",
            price: 850.0,
            status: "Completed",
            image: "assets/images/image-big-1.png"),
        CompletedOrder(
            name: "Regular Fit Slogan",
            size: "L",
            price: 1400.0,
            status: "Completed",
            image: "assets/images/image-big-4.png"),
        CompletedOrder(
            name: "Regular Fit Polo",
            size: "M",
            price: 850.0,
            status: "Completed",
            image: "assets/images/image-big-3.png"),
        CompletedOrder(
            name: "Regular Fit Slogan",
            size: "L",
            price: 1400.0,
            status: "Completed",
            image: "assets/images/image-big-1.png"),
        CompletedOrder(
            name: "Regular Fit Polo",
            size: "M",
            price: 850.0,
            status: "Completed",
            image: "assets/images/image-big-2.png"),
      ];
    });
  }
}
