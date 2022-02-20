import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_galery/models/photo.dart';
import 'package:photo_galery/screens/main/bloc/main_screen_bloc.dart';
import 'package:photo_galery/widgets/chache_image_widget.dart';

class ChachedImage extends StatelessWidget {
  final Photo photo;
  const ChachedImage({Key? key, required this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDisable = false;
    return InkWell(
      onTap: () {
        MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
        isDisable = bloc.notWorkingURL.contains(photo.url);

        if (isDisable) return;
        _handleItemState(context, photo);
      },
      child: Hero(
        tag: photo.url,
        child: ChachedImageWidget(
          url: photo.url,
          boxFit: BoxFit.cover,
        ),
      ),
    );
  }
}

void _handleItemState(BuildContext context, Photo photo) {
  Navigator.pushNamed(context, "/detail", arguments: photo);
}
