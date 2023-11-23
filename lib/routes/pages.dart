import 'package:get/get.dart';
import 'package:pet_store/modules/booking_list/view/booking_list_page.dart';
import 'package:pet_store/modules/booking_service/binding/booking_service_binding.dart';
import 'package:pet_store/modules/booking_service/view/booking_service_page.dart';
import 'package:pet_store/modules/cart/binding/cart_binding.dart';
import 'package:pet_store/modules/cart/view/cart_page.dart';
import 'package:pet_store/modules/forgot_password/binding/forgot_password_binding.dart';
import 'package:pet_store/modules/forgot_password/view/forgot_password_page.dart';
import 'package:pet_store/modules/home/binding/home_binding.dart';
import 'package:pet_store/modules/home/view/home_page.dart';
import 'package:pet_store/modules/order/binding/order_binding.dart';
import 'package:pet_store/modules/order/view/order_page.dart';
import 'package:pet_store/modules/order_list/binding/order_list_binding.dart';
import 'package:pet_store/modules/order_list/view/order_list_page.dart';
import 'package:pet_store/modules/profile/binding/profile_binding.dart';
import 'package:pet_store/modules/profile/view/profile_page.dart';
import 'package:pet_store/modules/sign_in/binding/sign_in_binding.dart';
import 'package:pet_store/modules/sign_in/view/sign_in_page.dart';
import 'package:pet_store/modules/sign_up/view/sign_up_page.dart';
import 'package:pet_store/routes/app_routes.dart';

import '../modules/booking_list/binding/booking_list_binding.dart';
import '../modules/sign_up/binding/sign_up_binding.dart';

final pages = [
  GetPage(
    name: AppRoutes.homePage,
    page: () => const HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoutes.signInPage,
    page: () => const SignInPage(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: AppRoutes.signUpPage,
    page: () => const SignUpPage(),
    binding: SignUpBinding(),
  ),
  GetPage(
    name: AppRoutes.cartPage,
    page: () => const CartPage(),
    binding: CartBinding(),
  ),
  GetPage(
    name: AppRoutes.forgotPasswordPage,
    page: () => const ForgotPasswordPage(),
    binding: ForgotPasswordBinding(),
  ),
  GetPage(
    name: AppRoutes.orderPage,
    page: () => const OrderPage(),
    binding: OrderBinding(),
  ),
  GetPage(
    name: AppRoutes.profilePage,
    page: () => const ProfilePage(),
    binding: ProfileBinding(),
  ),
  GetPage(
    name: AppRoutes.orderListPage,
    page: () => const OrderListPage(),
    binding: OrderListBinding(),
  ),
  GetPage(
    name: AppRoutes.bookingServicePage,
    page: () => const BookingServicePage(),
    binding: BookingServiceBinding(),
  ),
  GetPage(
    name: AppRoutes.bookingListPage,
    page: () => const BookingListPage(),
    binding: BookingListBinding(),
  ),
];
