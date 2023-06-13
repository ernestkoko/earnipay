import 'dart:async';
import 'package:earnipay/app/modules/home/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeRepository) : super(HomeInitState()) {
    on<LoadMorePhotosEvent>(_loadMorePhotos);
  }

  HomeRepository homeRepository;
  int page = 1;
  bool isFetching = false;
  final List<Photo> photos = [];

  FutureOr<void> _loadMorePhotos(
      LoadMorePhotosEvent event, Emitter<HomeState> emit) async {
    emit(HomePhotoLoadingState());
    try {
      final photosList = await homeRepository.getPhotos(page: page);
      photos.addAll(photosList);
      emit(HomePhotosReadyState(photos: photos));
      page++;
    } catch (e) {
      emit(HomePhotoErrorState(message: e.toString()));
    }
  }
}
