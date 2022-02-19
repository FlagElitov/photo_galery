import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_galery/screens/main/bloc/main_screen_bloc.dart';
import 'package:photo_galery/screens/main/view/grid_view_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Photo Galery"),
      ),
      body: BlocProvider(
        create: (context) => MainScreenBloc(),
        child: const GridViewWidget(),
      ),
    );
  }
}
