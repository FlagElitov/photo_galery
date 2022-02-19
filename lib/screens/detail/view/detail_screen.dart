import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:photo_galery/models/photo.dart';
import 'package:photo_galery/widgets/chache_image_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);
  void _errorWidget() {
    if (kDebugMode) print("error");
  }

  @override
  Widget build(BuildContext context) {
    Photo photo = ModalRoute.of(context)!.settings.arguments as Photo;
    Future<void> sharePhoto() async {
      await FlutterShare.share(
        title: 'See what the wonderful photo',
        linkUrl: photo.url,
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detail Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ChachedImageWidget(
          url: photo.url,
          errorWidget: _errorWidget,
          boxFit: BoxFit.fill,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => sharePhoto(),
        child: const Icon(Icons.share),
      ),
    );
  }
}
