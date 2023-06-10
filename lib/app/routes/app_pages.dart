import 'package:earnipay/app/modules/home/home.dart';
import 'package:flutter/material.dart';

import '../modules/photo_details/photo_details.dart';
import 'app_routes.dart';

abstract class AppPages {
  static final Map<String, Widget Function(dynamic)> page = {
    AppRoute.home: (_) => Home(),
    AppRoute.photoDetails: (ctx) =>const PhotoDetails()
  };
}
