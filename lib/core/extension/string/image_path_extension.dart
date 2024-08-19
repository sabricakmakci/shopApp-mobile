extension ImagePathExtension on String {
  String get toSvgIcon => 'assets/icons/$this.svg';
  String get toPngIcon => 'assets/icons/$this.png';
  String get toLottieAnimation => 'assets/animations/$this.json';
}
