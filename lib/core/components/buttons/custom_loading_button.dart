import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shop_app_mobile/core/utils/constants/color_constant.dart';
import 'package:shop_app_mobile/core/utils/constants/design_constant.dart';

import '../../ui/plus_widgets/shadow_plus.dart';

enum ButtonState { idle, loading, success, error }

enum CustomLoadingButtonType {
  primary,
  secondary,
}

class CustomLoadingButton extends StatefulWidget {
  final CustomLoadingButtonType type;
  final RoundedLoadingButtonController controller;
  final Function? onPressed;
  final Widget? child;
  final Color? color;
  final double height;
  final double? width;
  final double loaderSize;
  final double borderWidth;
  final double loaderStrokeWidth;
  final double elevation;
  final bool animateOnTap;
  final Color valueColor;
  final bool resetAfterDuration;
  final Curve curve;
  final double borderRadius;
  final Duration duration;
  final Duration resetduration;
  final Color? errorColor;
  final Color? successColor;
  final Color? disabledColor;
  final IconData failedIcon;
  final IconData successIcon;
  final Curve completionCurve;
  final Duration completionDuration;

  final EdgeInsets? padding;
  final Color? disabledBackgroundColor;
  final Color? borderColor;
  final Color? shadowColor;
  final bool loadingShrinking;
  final List<ShadowPlus>? shadows;

  Duration get _borderDuration => Duration(milliseconds: (duration.inMilliseconds / 2).round());

  const CustomLoadingButton({
    Key? key,
    required this.controller,
    required this.onPressed,
    required this.child,
    this.type = CustomLoadingButtonType.primary,
    this.color,
    this.height = 48,
    this.width,
    this.loaderSize = 24.0,
    this.borderWidth = 1.0,
    this.loaderStrokeWidth = 2.0,
    this.disabledBackgroundColor,
    this.animateOnTap = true,
    this.valueColor = ColorConstant.kWhiteColor,
    this.elevation = 10,
    this.resetAfterDuration = false,
    this.curve = Curves.easeInOutCirc,
    this.borderRadius = DesignConstant.kRadius8,
    this.duration = const Duration(milliseconds: 500),
    this.resetduration = const Duration(seconds: 15),
    this.errorColor = ColorConstant.kErrorColor,
    this.successColor,
    this.padding,
    this.disabledColor,
    this.failedIcon = Icons.close_rounded,
    this.successIcon = Icons.check_rounded,
    this.completionCurve = Curves.elasticOut,
    this.completionDuration = const Duration(milliseconds: 1000),
    this.borderColor,
    this.shadowColor,
    this.loadingShrinking = true,
    this.shadows,
  }) : super(key: key);
  bool get isEnabled => onPressed != null;
  @override
  State<CustomLoadingButton> createState() => _CustomLoadingButtonState();
}

class _CustomLoadingButtonState extends State<CustomLoadingButton> with TickerProviderStateMixin {
  late AnimationController _buttonController;
  late AnimationController _borderController;
  late AnimationController _checkButtonController;

  late Animation _bounceAnimation;
  late Animation _borderAnimation;

  final _state = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final check = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.successColor ?? theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.successIcon,
              color: widget.valueColor,
            )
          : null,
    );

    final cross = Container(
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: widget.errorColor,
        borderRadius: BorderRadius.all(Radius.circular(_bounceAnimation.value / 2)),
      ),
      width: _bounceAnimation.value,
      height: _bounceAnimation.value,
      child: _bounceAnimation.value > 20
          ? Icon(
              widget.failedIcon,
              color: widget.valueColor,
            )
          : null,
    );

    final loader = widget.loadingShrinking
        ? SizedBox(
            height: widget.loaderSize,
            width: widget.loaderSize,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
              strokeWidth: widget.loaderStrokeWidth,
            ))
        : SizedBox(
            width: widget.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: widget.loaderSize,
                  width: widget.loaderSize,
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(widget.valueColor),
                      strokeWidth: widget.loaderStrokeWidth),
                ),
              ],
            ),
          );

    final childStream = StreamBuilder(
      stream: _state,
      builder: (context, snapshot) => AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: snapshot.data == ButtonState.loading ? loader : widget.child),
    );

    final btn = ButtonTheme(
        shape: RoundedRectangleBorder(borderRadius: _borderAnimation.value),
        disabledColor: widget.disabledColor,
        padding: EdgeInsets.zero,
        child: ElevatedButton(
            style: widget.type == CustomLoadingButtonType.primary
                ? ElevatedButton.styleFrom(
                    minimumSize: Size(widget.width ?? MediaQuery.of(context).size.width, widget.height),
                    maximumSize: Size(widget.width ?? MediaQuery.of(context).size.width, widget.height),
                    foregroundColor: ColorConstant.kWhiteColor,
                    disabledMouseCursor: SystemMouseCursors.basic,
                    backgroundColor: widget.color ?? ColorConstant.kPrimary900Color,
                    disabledForegroundColor: ColorConstant.kDisabledColor,
                    disabledBackgroundColor: widget.disabledBackgroundColor ?? ColorConstant.kDisabledColor,
                    padding: widget.padding ?? EdgeInsets.zero,
                    side: BorderSide(
                      width: widget.borderWidth,
                      color: widget.borderColor ?? ColorConstant.kPrimary200Color,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                    ),
                    elevation: widget.elevation,
                  )
                : ElevatedButton.styleFrom(
                    minimumSize: Size(widget.width ?? MediaQuery.of(context).size.width, widget.height),
                    maximumSize: Size(widget.width ?? MediaQuery.of(context).size.width, widget.height),
                    foregroundColor: ColorConstant.kWhiteColor,
                    disabledMouseCursor: SystemMouseCursors.basic,
                    backgroundColor: widget.color ?? ColorConstant.kWhiteColor,
                    disabledForegroundColor: ColorConstant.kDisabledColor,
                    disabledBackgroundColor: widget.disabledBackgroundColor ?? ColorConstant.kDisabledColor,
                    padding: EdgeInsets.zero,
                    shadowColor: ColorConstant.kWhiteColor,
                    side: BorderSide(
                      width: widget.borderWidth,
                      color: widget.borderColor ?? ColorConstant.kPrimary200Color,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
                    ),
                    elevation: widget.elevation,
                  ),
            onPressed: widget.onPressed == null ? null : _btnPressed,
            child: childStream));

    return Container(
        height: widget.height,
        decoration: BoxDecoration(
          boxShadow: _buildShadow(),
        ),
        child: Center(
            child: _state.value == ButtonState.error
                ? cross
                : _state.value == ButtonState.success
                    ? check
                    : btn));
  }

  @override
  void initState() {
    super.initState();

    _buttonController = AnimationController(duration: widget.duration, vsync: this);

    _checkButtonController = AnimationController(duration: widget.completionDuration, vsync: this);

    _borderController = AnimationController(duration: widget._borderDuration, vsync: this);

    _bounceAnimation = Tween<double>(begin: 0, end: widget.height)
        .animate(CurvedAnimation(parent: _checkButtonController, curve: widget.completionCurve));

    _bounceAnimation.addListener(() {
      setState(() {});
    });

    _borderAnimation =
        BorderRadiusTween(begin: BorderRadius.circular(widget.borderRadius), end: BorderRadius.circular(widget.height))
            .animate(_borderController);

    _borderAnimation.addListener(() {
      setState(() {});
    });

    _state.stream.listen((event) {
      widget.controller._state.sink.add(event);
    });

    widget.controller._addListeners(_start, _stop, _success, _error, _reset);
  }

  @override
  void dispose() {
    _buttonController.dispose();
    _checkButtonController.dispose();
    _borderController.dispose();
    _state.close();

    super.dispose();
  }

  void _btnPressed() async {
    if (widget.animateOnTap) {
      _start();
    } else {
      if (widget.onPressed != null) {
        widget.onPressed?.call();
      }
    }
  }

  void _start() {
    _state.sink.add(ButtonState.loading);
    _borderController.forward();
    _buttonController.forward();
    if (widget.resetAfterDuration) _reset();
  }

  void _stop() {
    _state.sink.add(ButtonState.idle);
    _borderController.reverse();
    _buttonController.reverse();
  }

  void _success() {
    _state.sink.add(ButtonState.success);
    _checkButtonController.forward();
  }

  void _error() {
    _state.sink.add(ButtonState.error);
    _checkButtonController.forward();
  }

  void _reset() async {
    if (widget.resetAfterDuration) await Future.delayed(widget.resetduration);
    _state.sink.add(ButtonState.idle);
    _buttonController.reverse();
    _borderController.reverse();
    _checkButtonController.reverse();
  }

  List<BoxShadow> _buildShadow() {
    return [];
  }
}

class RoundedLoadingButtonController {
  VoidCallback _startListener = () {};
  VoidCallback _stopListener = () {};
  VoidCallback _successListener = () {};
  VoidCallback _errorListener = () {};
  VoidCallback _resetListener = () {};

  void _addListeners(
    VoidCallback startListener,
    VoidCallback stopListener,
    VoidCallback successListener,
    VoidCallback errorListener,
    VoidCallback resetListener,
  ) {
    _startListener = startListener;
    _stopListener = stopListener;
    _successListener = successListener;
    _errorListener = errorListener;
    _resetListener = resetListener;
  }

  final BehaviorSubject<ButtonState> _state = BehaviorSubject<ButtonState>.seeded(ButtonState.idle);

  Stream<ButtonState> get stateStream => _state.stream;

  ButtonState? get currentState => _state.value;

  void start() {
    _startListener();
  }

  void stop() {
    _stopListener();
  }

  void success() {
    _successListener();
  }

  void error() {
    _errorListener();
  }

  void reset() {
    _resetListener();
  }
}
