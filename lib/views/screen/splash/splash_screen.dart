import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app_mobile/core/components/base/custom_scaffold.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/route/route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      StaticRoute.goLoginScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarColor: ColorConstant.kPrimary900Color,
      backgroundColor: ColorConstant.kPrimary900Color,
      child: Stack(
        children: [
          SvgPicture.asset("assets/icons/vectors.svg"),
          Positioned(
            top: 300,
            left: MediaQuery.of(context).size.width / 2 - 65, // Ekranın ortasına yerleştirir
            child: SizedBox(
              height: 130,
              width: 130,
              child: SvgPicture.asset("assets/icons/splash-icon.svg"),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.kWhiteColor,
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
