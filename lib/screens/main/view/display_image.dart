import 'package:flutter/material.dart';
import 'package:photo_galery/models/photo.dart';
import 'package:photo_galery/widgets/chache_image_widget.dart';

class ChachedImage extends StatefulWidget {
  final Photo photo;
  const ChachedImage({Key? key, required this.photo}) : super(key: key);

  @override
  State<ChachedImage> createState() => _ChachedImageState();
}

class _ChachedImageState extends State<ChachedImage> {
  bool isDisable = false;
  void _handleItemState(BuildContext context, Photo photo) {
    Navigator.pushNamed(context, "/detail", arguments: photo);
  }

  Future errorWidget() async {
    setState(() => isDisable = true);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isDisable) return;
        _handleItemState(context, widget.photo);
      },
      child: ChachedImageWidget(
        url: widget.photo.url,
        errorWidget: errorWidget,
        boxFit: BoxFit.cover,
      ),
    );
  }
}
