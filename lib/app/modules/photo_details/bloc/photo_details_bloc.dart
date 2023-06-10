import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'photo_details_event.dart';
part 'photo_details_state.dart';
class PhotoDetailsBloc extends Bloc<PhotoDetailsEvent, PhotoDetailsState>{
  PhotoDetailsBloc():super(PhotoDetailsInitState()){

  }
}