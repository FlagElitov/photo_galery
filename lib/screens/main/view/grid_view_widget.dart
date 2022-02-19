import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_galery/screens/main/bloc/main_screen_bloc.dart';
import 'package:photo_galery/widgets/sliver_grid_widget.dart';
import 'package:photo_galery/widgets/sliver_list_widget.dart';

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({Key? key}) : super(key: key);
  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  @override
  void initState() {
    super.initState();
    MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
    bloc.scrollController.addListener(() {
      if (!bloc.isLoading) _listenController(bloc.scrollController, bloc);
    });
  }

  @override
  Widget build(BuildContext context) {
    MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height,
      width: size.width,
      child: CustomScrollView(
        controller: bloc.scrollController,
        slivers: const <Widget>[
          SliverGridWidget(),
          SliverListWidget(textEnd: "End of story :(")
        ],
      ),
    );
  }

  @override
  void dispose() {
    MainScreenBloc bloc = BlocProvider.of<MainScreenBloc>(context);
    bloc.scrollController.dispose();
    super.dispose();
  }
}

Future _listenController(
    ScrollController scrollController, MainScreenBloc bloc) async {
  if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent &&
      !bloc.isLimitLength) {
    bloc.add(GenerateNewPhotoEvent());
  }
}
