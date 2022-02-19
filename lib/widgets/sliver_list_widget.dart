import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_galery/screens/main/bloc/main_screen_bloc.dart';

class SliverListWidget extends StatelessWidget {
  final String textEnd;
  const SliverListWidget({Key? key, required this.textEnd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      buildWhen: (bloc, state) => state is ChangedLoaderState,
      builder: (BuildContext context, MainScreenState state) {
        MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (bloc.isLimitLength) {
                return SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: Text(textEnd),
                  ),
                );
              }
              return const Padding(
                padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
            childCount: 1,
          ),
        );
      },
    );
  }
}
