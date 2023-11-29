import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pet_store/routes/app_routes.dart';
import 'package:pet_store/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared/constants/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = Get.find<SharedPreferences>();
    return GetMaterialApp(
      title: 'Pet Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      initialRoute: storage.getString(Strings.idUser) != null
          ? AppRoutes.homePage
          : AppRoutes.signInPage,
      getPages: pages,
      builder: EasyLoading.init(),
    );
  }
}
