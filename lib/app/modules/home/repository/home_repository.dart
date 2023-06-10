import 'package:earnipay/app/data/model/model.dart';
import 'package:earnipay/app/data/services/service.dart';

class HomeRepository {
  final PhotoServiceInterface photoService = PhotoServiceInterface.instance;

  Future<List<Photo>> getPhotos({int? page}) async {
    try {
      final photos = await photoService.getPhotos(page: page);
      return photos;
    } catch (error) {
      rethrow;
    }
  }
}
