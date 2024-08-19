import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shop_app_mobile/core/components/base/base_state.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key, required this.asset});
  final String asset;
  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends BaseState<AnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: LottieBuilder.asset(
        widget.asset,
        frameRate: FrameRate.max,
        controller: animationController,
        onLoaded: (composition) {
          animationController
            ..duration = composition.duration
            ..forward()
            ..repeat();
        },
        repeat: true,
      ),
    );
  }
}
