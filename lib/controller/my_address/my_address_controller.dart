import 'package:get/get.dart';

import '../../model/response/address_model.dart';

class MyAddressController extends GetxController {
  RxList<Address> addresses = <Address>[].obs;
  RxString selectedAddressTitle = ''.obs;

  Future<void> getAddress() async {
    addresses.value = [
      Address(
        title: "Ev",
        description: "123 Sokak, Mahalle, Şehir, Ülke",
        isDefault: false,
      ),
      Address(
        title: "İş",
        description: "456 Cadde, Mahalle, Şehir, Ülke",
        isDefault: true,
      ),
    ];
    selectedAddressTitle.value = addresses.firstWhere((address) => address.isDefault).title;
  }

  void setSelectedAddress(String title) {
    selectedAddressTitle.value = title;
  }
}
