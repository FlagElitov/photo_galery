part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class GenerateNewPhotoEvent extends MainScreenEvent {
  GenerateNewPhotoEvent();

  List<Object> get props => [];
}

class GeneratePhotoEvent extends MainScreenEvent {
  List<Object> get props => [];
}

class ChangeLoaderEvent extends MainScreenEvent {
  final bool isLoading;
  ChangeLoaderEvent(this.isLoading);

  List<Object> get props => [isLoading];
}

class AddedDoesntWorkedURLEvent extends MainScreenEvent {
  final String text;
  AddedDoesntWorkedURLEvent(this.text);

  List<Object> get props => [text];
}
