part of 'loading_bloc.dart';

@immutable
abstract class LoadingState {}

class LoadingInitial extends LoadingState {}
class LoadingData extends LoadingState {}
class LoadedData extends LoadingState {
  final UserData userData;
  LoadedData({required this.userData});
}
class ErrorLoadedData extends LoadingState {}
