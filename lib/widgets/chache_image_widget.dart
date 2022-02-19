import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_galery/widgets/mock_widget.dart';

class ChachedImageWidget extends StatelessWidget {
  final String url;
  final Function errorWidget;
  final BoxFit boxFit;
  const ChachedImageWidget(
      {Key? key,
      required this.url,
      required this.errorWidget,
      required this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 3,
                offset: const Offset(0, 3),
              ),
            ],
            image: DecorationImage(
              image: imageProvider,
              fit: boxFit,
            ),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) {
          () => errorWidget();
          return const MockWidget();
        },
      );
}
