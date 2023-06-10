part of 'home_bloc.dart';
abstract class HomeState extends Equatable{
}
class HomeInitState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomePhotoLoadingState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomePhotosReadyState extends HomeState{
  HomePhotosReadyState({this.photos =const []});
  final List<Photo> photos;
  @override
  List<Object?> get props => [photos];
}
class HomeNoMorePhotoState extends HomeState{
  @override
  List<Object?> get props => [];
}

class HomePhotoErrorState extends HomeState{
  HomePhotoErrorState({this.message});
  final String? message;
  @override
  List<Object?> get props => [message];
}