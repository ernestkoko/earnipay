import 'package:earnipay/app/data/model/model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/image_builder.dart';

class PhotoDetails extends StatelessWidget {
  const PhotoDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)?.settings.arguments as Photo;
    final image = photo.image?.regular!;
    final description = photo.description;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: EarniNetworkImage(
                      url: image!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                    bottom: 8,right: 8,
                    child: Text('${photo.user?.location}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w800,
                      fontSize: 20
                    ),),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '$description',
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
