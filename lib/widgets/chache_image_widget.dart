import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_galery/screens/main/bloc/main_screen_bloc.dart';
import 'package:photo_galery/widgets/mock_widget.dart';

class ChachedImageWidget extends StatelessWidget {
  final String url;
  final BoxFit boxFit;
  const ChachedImageWidget({
    Key? key,
    required this.url,
    required this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
            _ImageBuilder(
          imageProvider: imageProvider,
          boxFit: boxFit,
        ),
        placeholder: (BuildContext context, String url) =>
            const _LoaderWidget(),
        errorWidget: (BuildContext context, String url, error) {
          MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
          bloc.add(AddedDoesntWorkedURLEvent(url));
          return const MockWidget();
        },
      );
}

class _ImageBuilder extends StatelessWidget {
  final ImageProvider imageProvider;
  final BoxFit boxFit;
  const _ImageBuilder(
      {Key? key, required this.imageProvider, required this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(),
      ),
    );
  }
}
