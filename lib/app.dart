import 'package:flutter/material.dart';
import 'package:photo_galery/core/app_route.dart';
import 'package:photo_galery/core/app_theme.dart';

class MyGalaryApp extends StatelessWidget {
  const MyGalaryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Galery',
      debugShowCheckedModeBanner: false,
      routes: AppRouter.routes,
      theme: AppTheme.theme,
      home: AppRouter.routes["/main"]!(context),
    );
  }
}
