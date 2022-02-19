import 'package:flutter/material.dart';
import 'package:photo_galery/models/photo.dart';
import 'package:photo_galery/screens/main/view/display_image.dart';

class SliverGridWidget extends StatelessWidget {
  final List<Photo> photo;
  const SliverGridWidget({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.85,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) => ChachedImage(
          photo: photo[index],
        ),
        childCount: photo.length,
      ),
    );
  }
}
