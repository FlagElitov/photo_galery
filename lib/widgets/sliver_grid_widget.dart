import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_galery/screens/main/bloc/main_screen_bloc.dart';
import 'package:photo_galery/screens/main/view/display_image.dart';

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenBloc, MainScreenState>(
      buildWhen: (bloc, state) =>
          state is GeneratedPhotoState || state is AddedDoesntWorkedURLState,
      builder: (BuildContext context, MainScreenState state) {
        MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.85,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => ChachedImage(
              photo: bloc.photo[index],
            ),
            childCount: bloc.photo.length,
          ),
        );
      },
    );
  }
}
