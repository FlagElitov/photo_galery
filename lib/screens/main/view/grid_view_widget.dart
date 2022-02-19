import 'package:flutter/material.dart';
import 'package:photo_galery/models/photo.dart';
import 'package:photo_galery/utils/generate_photo.dart';
import 'package:photo_galery/widgets/sliver_grid_widget.dart';
import 'package:photo_galery/widgets/sliver_list_widget.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List<Photo> photo = generatePhoto();
  final ScrollController _scrollController = ScrollController();
  int limit = 100;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(status) => _isLoading = status;
  bool get isLimitLength => photo.length >= limit;

  Future _addController(ScrollController scrollController) async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLimitLength) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        photo.addAll(generatePhoto().toList());
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (!isLoading) _addController(_scrollController);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height,
      width: size.width,
      child: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverGridWidget(photo: photo),
          SliverListWidget(
            isLimitLength: isLimitLength,
            isLoading: isLoading,
            textEnd: "End of story :(",
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
