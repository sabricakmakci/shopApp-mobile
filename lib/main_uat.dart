import 'package:flutter/material.dart';

import 'init_main.dart';
import 'main_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await InitMain.initController();
  runApp(
    const MyApp(),
  );
}
