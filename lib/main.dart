import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_galery/app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
