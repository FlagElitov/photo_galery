import 'package:flutter/material.dart';

class SliverListWidget extends StatelessWidget {
  final bool isLimitLength;
  final bool isLoading;
  final String textEnd;

  const SliverListWidget(
      {Key? key, required this.isLimitLength, required this.isLoading,required this.textEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (isLimitLength) {
            return  SizedBox(
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
  }
}
