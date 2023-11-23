import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/service.dart';
import 'package:pet_store/modules/home/controller/home_controller.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/shared/items/item_service.dart';
import 'package:pet_store/shared/services/firebase_service.dart';
import 'package:pet_store/shared/utils/dialog_utils.dart';

import '../../utils/app_utils.dart';

class MenuPanel extends StatefulWidget {
  const MenuPanel({super.key});

  @override
  State<MenuPanel> createState() => _MenuPanelState();
}

class _MenuPanelState extends State<MenuPanel> {
  List<Service> services = [];

  bool isSignedIn = FirebaseService.isUserSignedIn();
  final homeController = Get.find<HomeController>();
  User? currentUser;

  @override
  void initState() {
    initData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: isSignedIn
          ? SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUserPanel(),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Text(
                        'dịch vụ và điều trị'.toUpperCase(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: services.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ItemService(
                        service: services[index],
                        onClick: () {
                          Get.toNamed(AppRoutes.bookingServicePage,
                              arguments: index);
                        },
                      ),
                    ),
                    const SizedBox(height: 32.0),
                  ],
                ),
              ),
            )
          : Center(child: _buildNotSignInPanel()),
    );
  }

  Widget _buildUserPanel() {
    return currentUser != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  UserAccountsDrawerHeader(
                      margin: EdgeInsets.zero,
                      decoration: const BoxDecoration(color: Colors.white),
                      currentAccountPicture: Container(
                        width: 60.0,
                        height: 60.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amberAccent,
                            image: currentUser!.photoURL != null
                                ? DecorationImage(
                                    image: NetworkImage(currentUser!.photoURL!))
                                : null),
                        alignment: Alignment.center,
                        child: Text(
                          AppUtils.generateNameAvatar(
                              currentUser!.displayName ?? 'Tên Người Dùng'),
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      accountName: Text(
                        currentUser!.displayName ?? 'Tên Người Dùng',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Text(
                        currentUser!.email ?? 'Địa chỉ email',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black26,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Positioned(
                    top: 0.0,
                    right: 12.0,
                    child: TextButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.profilePage);
                      },
                      child: Text('chỉnh sửa'.toUpperCase()),
                    ),
                  )
                ],
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: const Icon(Icons.shopping_cart),
                title: Text(
                  'giỏ hàng của bạn'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.cartPage);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: const Icon(Icons.article),
                title: Text(
                  'Đơn hàng của bạn'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.orderListPage);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: const Icon(Icons.event),
                title: Text(
                  'Đặt lịch của tôi'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.bookingListPage);
                },
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                leading: const Icon(Icons.logout),
                title: Text(
                  'đăng xuất'.toUpperCase(),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                ),
                onTap: () {
                  DialogUtils.showConfirmSignOut(context, () {
                    homeController.onSignOut();
                    Navigator.pop(context);
                  });
                },
              ),
              const SizedBox(height: 24.0),
            ],
          )
        : const CircularProgressIndicator();
  }

  Widget _buildNotSignInPanel() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Bạn chưa đăng nhập. Xin hãy đăng nhập để sử dụng dịch vụ',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Center(
            child: MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Get.toNamed(AppRoutes.signInPage);
              },
              color: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: const Text(
                'Đăng nhập',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void initData() {
    currentUser = FirebaseService.getCurrentUser();
    FirebaseService.getServices((dataList) {
      setState(() {
        services.addAll(dataList);
      });
    });
  }
}
