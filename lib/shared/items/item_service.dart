import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/models/service.dart';

class ItemService extends StatelessWidget {
  final Service service;
  final Function() onClick;

  const ItemService({
    super.key,
    required this.service,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CachedNetworkImage(
              width: 56.0,
              height: 56.0,
              imageUrl: service.imageService,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 12.0),
            Text(
              service.name.toUpperCase(),
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
