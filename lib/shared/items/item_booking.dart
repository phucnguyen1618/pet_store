import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_store/models/booking.dart';
import 'package:pet_store/shared/items/item_service_in_booking.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/utils/app_utils.dart';

class ItemBooking extends StatefulWidget {
  final Booking booking;
  const ItemBooking({super.key, required this.booking});

  @override
  State<ItemBooking> createState() => _ItemBookingState();
}

class _ItemBookingState extends State<ItemBooking> {
  User? currentUser;

  @override
  void initState() {
    currentUser = FirebaseService.getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.event,
                color: Colors.black26,
                size: 16.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Ngày thực hiện: ${AppUtils.formatBookingDateTime(widget.booking.orderDateTime)}',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black26,
                ),
              )
            ],
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
                child: Text(
              AppUtils.generateNameAvatar(
                  currentUser!.displayName ?? 'Tên Người Dùng'),
              style: const TextStyle(
                fontSize: 12.0,
                color: Colors.white,
              ),
            )),
            title: Text(
              currentUser!.displayName ?? 'Tên Người Dùng',
              maxLines: 1,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            subtitle: Text(
              currentUser!.email ?? 'user.example@gmail.com',
              maxLines: 1,
              style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis),
            ),
            trailing: Text(
              AppUtils.formatBookingStatus(widget.booking.status),
              style: TextStyle(
                fontSize: 14.0,
                color: AppUtils.formatBookingStatusColor(widget.booking.status),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: widget.booking.bookingDetails
                .map((e) => ItemServiceInBooking(id: e.id))
                .toList(),
          ),
          const Text(
            'Người thực hiện',
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          RichText(
              text: const TextSpan(
                  text: 'Bác sĩ: ',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                TextSpan(
                  text: 'Trần Ngọc Huỳnh Anh',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ]))
        ],
      ),
    );
  }
}
