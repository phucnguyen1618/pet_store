import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:pet_store/models/booking.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/models/order.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product.dart';
import '../../models/account.dart';
import '../constants/strings.dart';
import '../../models/service.dart' as service;

class FirebaseService {
  static final _firebaseAuth = FirebaseAuth.instance;
  static final _firebaseDatabase = FirebaseDatabase.instance;

  static final _dbRef = _firebaseDatabase.refFromURL(Strings.databaseUrl);
  static final prefs = Get.find<SharedPreferences>();

  //Auth
  static Future<void> signIn({
    required String email,
    required String password,
    required Function(String) onComplete,
    required Function(String) onError,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        onComplete(userCredential.user!.uid);
      }
    } on FirebaseAuthException catch (error) {
      log('Log: ${error.code} - ${error.message}');
      String message;
      switch (error.code) {
        case 'user-not-found':
          message = 'Tài khoản không tồn tại';
          break;
        case 'wrong-password':
          message = 'Mật khẩu không đúng';
          break;
        case 'invalid-credential':
          message = 'Tài khoản không tồn tại';
          break;
        default:
          message = 'Đã có lỗi xảy ra. Vui lòng đăng nhập lại';
          break;
      }
      onError(message);
    }
  }

  static Future<void> signUp({
    required String email,
    required String password,
    required Function(String) onComplete,
    required Function(String) onError,
  }) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (userCredential.user != null) {
        onComplete(userCredential.user!.uid);
      }
    } on FirebaseAuthException catch (error) {
      String message;
      switch (error.code) {
        case 'email-already-in-use':
          message = 'Địa chỉ email đã được sử dụng bởi một tài khoản khác';
          break;
        case 'weak-password':
          message = 'Mật khẩu quá yếu';
          break;
        default:
          message = 'Đã có lỗi xảy ra. Vui lòng thao tác lại';
          break;
      }
      onError(message);
    }
  }

  static bool isUserSignedIn() {
    return _firebaseAuth.currentUser != null ? true : false;
  }

  static User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  static void signOut() {
    _firebaseAuth.signOut().then((value) {
      prefs.remove(Strings.idUser);
    });
  }

  static void passwordRetrieval(String email) {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  //User
  static void updateNameUser(String fullname) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      User? currentUser = getCurrentUser();
      currentUser!.updateDisplayName(fullname);
      _dbRef.child('Accounts').child(idUser).update({"name": fullname});
    }
  }

  static void updatePhoneUser(String phone) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Accounts').child(idUser).update({"phone": phone});
    }
  }

  static void updateBirthday(DateTime dateTime) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef
          .child('Accounts')
          .child(idUser)
          .update({"birthDay": dateTime.toIso8601String()});
    }
  }

  static void updateSex(int sex) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Accounts').child(idUser).update({"sex": sex});
    }
  }

  static void fetchUserInfo(Function(Account) onComplete) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Accounts').child(idUser).get().then((snapshot) {
        final dataValue =
            jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
        Account account = Account.fromJson(dataValue);
        onComplete(account);
      });
    }
  }

  static void writeAccountToDb(Account account) {
    _dbRef.child('Accounts').child(account.id).set(account.toJson());
    User? currentUser = getCurrentUser();
    if (currentUser != null) {
      currentUser.updateDisplayName(account.name);
    }
  }

  //Product
  static void fetchProductList(Function(List<Product>) onComplete) {
    List<Product> products = [];
    _dbRef.child('Products').get().then((snapshot) {
      for (DataSnapshot dataSnapshot in snapshot.children) {
        final dataMap =
            jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
        Product product = Product.fromJson(dataMap);
        products.add(product);
      }
      onComplete(products);
    });
  }

  static void getProductInfoByID(
    String id,
    Function(Product) onComplete,
    Function(String) onError,
  ) {
    _dbRef.child('Products').child(id).get().then((snapshot) {
      final data =
          jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
      Product product = Product.fromJson(data);
      onComplete(product);
    }).onError((error, stackTrace) => onError(error.toString()));
  }

  //Cart
  static void writeCartToDb(Cart item) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef
          .child('Carts')
          .child(idUser)
          .child(item.idItem)
          .set(item.convertToJson());
    }
  }

  static void getCarts(Function(List<Cart> items) onComplete) {
    List<Cart> itemCarts = [];
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Carts').child(idUser).get().then((snapshot) {
        for (DataSnapshot dataSnapshot in snapshot.children) {
          final data = jsonDecode(jsonEncode(dataSnapshot.value))
              as Map<String, dynamic>;
          final itemCart = Cart.fromJson(data);
          itemCarts.add(itemCart);
        }
        onComplete(itemCarts);
      });
    }
  }

  static void removeItemCartByID(Cart itemCart) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Carts').child(idUser).child(itemCart.idItem).remove();
    }
  }

  static void removeCartList() {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Carts').child(idUser).remove();
    }
  }

  static void updateQuantity(String idCart, int value) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef
          .child('Carts')
          .child(idUser)
          .child(idCart)
          .update({"quantity": value});
    }
  }

  //Order
  static void writeOrderToDb(
    Order order,
    Function() onComplete,
    Function(String) onError,
  ) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef
          .child('Orders')
          .child(idUser)
          .child(order.idOrder)
          .set(order.convertToJson())
          .then((value) => onComplete())
          .onError((error, stackTrace) => onError(error.toString()));
    }
  }

  static void getOrderList(
    Function(List<Order>) onComplete,
    Function(String) onError,
  ) {
    List<Order> orderList = [];
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('Orders').child(idUser).get().then((snapshot) {
        for (DataSnapshot dataSnapshot in snapshot.children) {
          final data = jsonDecode(jsonEncode(dataSnapshot.value))
              as Map<String, dynamic>;
          Order order = Order.fromJson(data);
          orderList.add(order);
        }
        onComplete(orderList);
      }).onError((error, stackTrace) => onError(error.toString()));
    }
  }

  //Booking Service
  static void writeBookingServiceToDb(
    Booking booking,
    Function() onComplete,
    Function(String) onError,
  ) {
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef
          .child('BookingServices')
          .child(idUser)
          .child(booking.idBooking)
          .set(booking.convertToJson())
          .then((value) => onComplete())
          .onError((error, stackTrace) => onError(error.toString()));
    }
  }

  static void getBookingServiceList(
    Function(List<Booking>) onComplete,
    Function(String) onError,
  ) {
    List<Booking> bookingServices = [];
    final idUser = prefs.getString(Strings.idUser);
    if (idUser != null) {
      _dbRef.child('BookingServices').child(idUser).get().then((snapshot) {
        for (DataSnapshot dataSnapshot in snapshot.children) {
          final data = jsonDecode(jsonEncode(dataSnapshot.value))
              as Map<String, dynamic>;
          Booking booking = Booking.fromJson(data);
          bookingServices.add(booking);
        }
        onComplete(bookingServices);
      });
    }
  }

  //Service
  static void getServices(Function(List<service.Service>) onComplete) {
    List<service.Service> services = [];
    _dbRef.child('Services').get().then((snapshot) {
      for (DataSnapshot dataSnapshot in snapshot.children) {
        final data =
            jsonDecode(jsonEncode(dataSnapshot.value)) as Map<String, dynamic>;
        service.Service dataService = service.Service.fromJson(data);
        services.add(dataService);
      }
      onComplete(services);
    });
  }

  static void getServiceByID(
      String idService, Function(service.Service) onComplete) {
    _dbRef.child('Services').child(idService).get().then((snapshot) {
      final data =
          jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
      service.Service dataService = service.Service.fromJson(data);
      onComplete(dataService);
    });
  }
}
