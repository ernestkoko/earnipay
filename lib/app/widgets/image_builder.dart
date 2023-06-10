import 'package:cached_network_image/cached_network_image.dart';
import 'package:earnipay/app/data/model/model.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class EarniNetworkImage extends StatelessWidget {
  EarniNetworkImage(
      {required this.url,
      this.photo,
      this.index,
      this.fit,
      this.progressIndicator,
      Key? key})
      : super(key: key);
  String url;
  Photo? photo;
  BoxFit? fit;
  int? index;
  Widget? progressIndicator;

  double pp = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: photo == null
          ? null
          : () {
              Navigator.of(context)
                  .pushNamed(AppRoute.photoDetails, arguments: photo);
            },
      child: CachedNetworkImage(
        imageUrl: url,
        fit: fit,
        alignment: Alignment.topCenter,
        progressIndicatorBuilder: (ctx, uri, progress) {
          return progressIndicator == null
              ? LinearProgressIndicator(
                  value: progress.progress,
                )
              : progressIndicator!;
        },
        errorWidget: (context, uri, error) {
          return const Text(
            "Error occurred",
            overflow: TextOverflow.ellipsis,
          );
        },
      ),
    );

  }
}
