import 'dart:convert';

import 'package:earnipay/app/data/model/model.dart';
import 'package:earnipay/app/data/services/photo/photo_service_interface.dart';
import 'package:http/http.dart' as http;

class PhotoService implements PhotoServiceInterface {
  final baseUrl =
      'https://api.unsplash.com/photos/?client_id=H0tEAyYMIFs5UqCcFTS9jWmqyBS-lssajPxOLsowqk0&page';


  @override
  Future<List<Photo>> getPhotos({int? page}) async {
    try {
      final response = await http.get(Uri.parse("$baseUrl&page=$page"));
      final body = json.decode(response.body) as List;
      final photos = body.map((e) => Photo.fromJson(e)).toList();
      return photos;
    } catch (e) {
      rethrow;
    }
  }
}
