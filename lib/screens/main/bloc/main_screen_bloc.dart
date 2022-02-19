import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:photo_galery/models/photo.dart';
import 'package:photo_galery/utils/generate_photo.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  List<Photo> photo = generatePhoto();
  final ScrollController scrollController = ScrollController();
  int limit = 100;
  List<String> notWorkingURL = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(status) => _isLoading = status;
  bool get isLimitLength => photo.length >= limit;

  MainScreenBloc() : super(MainScreenInitial());

  @override
  Stream<MainScreenState> mapEventToState(
    MainScreenEvent event,
  ) async* {
    if (event is GenerateNewPhotoEvent) {
      add(ChangeLoaderEvent(true));
      await Future.delayed(const Duration(seconds: 2));
      add(GeneratePhotoEvent());
      add(ChangeLoaderEvent(false));
    }
    if (event is GeneratePhotoEvent) {
      photo.addAll(generatePhoto().toList());
      yield GeneratedPhotoState();
    }
    if (event is ChangeLoaderEvent) {
      isLoading = event.isLoading;
      yield ChangedLoaderState();
    }
    if (event is AddedDoesntWorkedURLEvent) {
      notWorkingURL.add(event.text);
      AddedDoesntWorkedURLState();
    }
  }
}
