import 'package:shop_app_mobile/core/components/bottom_bar/bottom_bar_menu.dart';
import 'package:shop_app_mobile/views/screen/add_new_card/add_new_card_screen.dart';
import 'package:shop_app_mobile/views/screen/change_language/change_language_screen.dart';
import 'package:shop_app_mobile/views/screen/forgot_password/forgot_password_screen.dart';
import 'package:shop_app_mobile/views/screen/forgot_password/reset_password_screen.dart';
import 'package:shop_app_mobile/views/screen/forgot_password/verification_code_screen.dart';
import 'package:shop_app_mobile/views/screen/my_address/my_address_screen.dart';
import 'package:shop_app_mobile/views/screen/my_details/my_details.dart';
import 'package:shop_app_mobile/views/screen/my_orders/my_orders.dart';
import 'package:shop_app_mobile/views/screen/notification/notification_screen.dart';
import 'package:shop_app_mobile/views/screen/payment_methods/payment_methods_screen.dart';

import '../../../views/screen/login/login_screen.dart';
import '../../../views/screen/register/register_Screen.dart';
import 'app_route.dart';

class StaticRoute {
  static const loginScreen = '/LoginScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const verificatonCodeScreen = '/verificatonCodeScreen';
  static const resetPasswordScreen = '/resetPasswordScreen';
  static const registerScreen = '/RegisterScreen';
  static const homeScreen = '/HomeScreen';
  static const bottomBar = '/BottomBar';
  static const notificationScreen = '/NotificationScreen';
  static const myOrdersScreen = '/MyOrdersScreen';
  static const myDetailsScreen = '/MyDetailsScreen';
  static const changeLanguageScreen = '/ChangeLanguageScreen';
  static const myAddressScreen = '/MyAddressScreen';
  static const paymentMethodsScreen = '/PaymentMethodsScreen';
  static const addNewCardScreen = '/AddNewCardScreen';

  static void goRegisterScreen() async {
    await AppRouter.navigeTo(
      page: () => const RegisterScreen(),
      routeName: StaticRoute.registerScreen,
    );
  }

  static void goLoginScreen() async {
    await AppRouter.navigeToRemoveAll(
      page: () => const LoginScreen(),
      routeName: StaticRoute.loginScreen,
    );
  }

  static void goForgotPasswordScreen() async {
    await AppRouter.navigeTo(
      page: () => const ForgotPasswordScreen(),
      routeName: StaticRoute.forgotPasswordScreen,
    );
  }

  static void goVerificationCodeScreen() async {
    await AppRouter.navigeTo(
      page: () => const VerificationCodeScreen(),
      routeName: StaticRoute.verificatonCodeScreen,
    );
  }

  static void goResetPasswordScreen() async {
    await AppRouter.navigeTo(
      page: () => const ResetPasswordScreen(),
      routeName: StaticRoute.resetPasswordScreen,
    );
  }

  static void goBottomBar() async {
    await AppRouter.navigeToRemoveAll(
      page: () => const BottomBar(),
      routeName: StaticRoute.bottomBar,
    );
  }

  static void goNotificationScreen() async {
    await AppRouter.navigeTo(
      page: () => const NotificationScreen(),
      routeName: StaticRoute.notificationScreen,
    );
  }

  static void goMyOrdersScreen() async {
    await AppRouter.navigeTo(
      page: () => const MyOrdersScreen(),
      routeName: StaticRoute.myOrdersScreen,
    );
  }

  static void goMyDetailsScreen() async {
    await AppRouter.navigeTo(
      page: () => const MyDetailsScreen(),
      routeName: StaticRoute.myDetailsScreen,
    );
  }

  static void goChangeLanguageScreen() async {
    await AppRouter.navigeTo(
      page: () => const ChangeLanguageScreen(),
      routeName: StaticRoute.changeLanguageScreen,
    );
  }

  static void goMyAddressScreen() async {
    await AppRouter.navigeTo(
      page: () => const MyAddressScreen(),
      routeName: StaticRoute.myAddressScreen,
    );
  }

  static void goPaymentMethodsScreen() async {
    await AppRouter.navigeTo(
      page: () => const PaymentMethodsScreen(),
      routeName: StaticRoute.myAddressScreen,
    );
  }

  static void goAddNewCardScreen() async {
    await AppRouter.navigeTo(
      page: () => const AddNewCardScreen(),
      routeName: StaticRoute.addNewCardScreen,
    );
  }
}
