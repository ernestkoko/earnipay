import 'package:earnipay/app/data/services/photo/photo_service.dart';

import '../../model/model.dart';

abstract class PhotoServiceInterface{
   static PhotoServiceInterface instance = PhotoService();

  Future<List<Photo>> getPhotos({int? page})async {
    throw UnimplementedError('getPhotos has not been implemented');
  }


}