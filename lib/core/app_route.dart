import 'package:flutter/material.dart';
import 'package:photo_galery/screens/detail/view/detail_screen.dart';
import 'package:photo_galery/screens/main/view/main_screen.dart';

class AppRouter {
  static Map<String, WidgetBuilder> routes = {
    "/main": (context) => const MainScreen(),
    "/detail": (context) => const DetailScreen(),
  };
}
