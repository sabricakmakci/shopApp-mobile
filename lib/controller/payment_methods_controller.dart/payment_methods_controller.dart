import 'package:get/get.dart';
import 'package:shop_app_mobile/model/response/credit_cards_model.dart';

class PaymentMethodsController extends GetxController {
  RxList<CreditCards> creditCards = <CreditCards>[].obs;
  RxString selectedCreditCardNumber = ''.obs;

  Future<void> getCreditCards() async {
    creditCards.value = [
      CreditCards(
        number: "****************2334",
        image: "visa",
        isDefault: false,
      ),
      CreditCards(
        number: "****************5678",
        image: "mastercard",
        isDefault: true,
      ),
    ];
    selectedCreditCardNumber.value = creditCards.firstWhere((creditCard) => creditCard.isDefault).number;
  }

  void setSelectedCard(String number) {
    selectedCreditCardNumber.value = number;
  }
}
