import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/models/service.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/utils/app_utils.dart';

class ItemServiceInBooking extends StatefulWidget {
  final String id;
  const ItemServiceInBooking({super.key, required this.id});

  @override
  State<ItemServiceInBooking> createState() => _ItemServiceInBookingState();
}

class _ItemServiceInBookingState extends State<ItemServiceInBooking> {
  Service? service;

  @override
  void initState() {
    getServiceInfo(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return service != null
        ? Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                CachedNetworkImage(
                  imageUrl: service!.imageService,
                  width: 32.0,
                  height: 32.0,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    service!.name,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '${AppUtils.formatPrice(service!.price)}đ',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }

  void getServiceInfo(String id) {
    FirebaseService.getServiceByID(id, (dataValue) {
      setState(() {
        service = dataValue;
      });
    });
  }
}
