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
              : SizedBox(
              height: 10,width: 10,
              child: progressIndicator!);
        },
        errorWidget: (context, uri, error) {
          return
              Center(
                child: Text(
                  "Error: ${error.toString()}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.red),
                ),
              )
           ;
        },
      ),
    );
  }
}
