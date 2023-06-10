import 'package:cached_network_image/cached_network_image.dart';
import 'package:earnipay/app/data/model/model.dart';
import 'package:flutter/material.dart';

import '../routes/app_routes.dart';

class EarniNetworkImage extends StatefulWidget {
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
  State<EarniNetworkImage> createState() => _EarniNetworkImageState();
}

class _EarniNetworkImageState extends State<EarniNetworkImage> {


  @override
  Widget build(BuildContext context) {
    print('REBUILD');
    return GestureDetector(
      onTap: widget.photo == null
          ? null
          : () {
              Navigator.of(context)
                  .pushNamed(AppRoute.photoDetails, arguments: widget.photo);
            },
      child: CachedNetworkImage(
        imageUrl: widget.url,
        fit: widget.fit,
        alignment: Alignment.topCenter,
        progressIndicatorBuilder: (ctx, uri, progress) {
          return widget.progressIndicator == null
              ? LinearProgressIndicator(
                  value: progress.progress,
                )
              : widget.progressIndicator!;
        },
        errorWidget: (context, uri, error) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Error: ${error.toString()}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.red),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    print("URL: ${widget.url}");
                  });
                },
                child: const Text('Try again'),
              )
            ],
          );
        },
      ),
    );
  }
}
