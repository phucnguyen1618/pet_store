import 'package:hive/hive.dart';
import 'package:pet_store/models/cart.dart';
import 'package:pet_store/models/product.dart';
import 'package:uuid/uuid.dart';

class HiveService {
  static Future<Box<Cart>> openCartBox() async =>
      await Hive.openBox<Cart>('Carts');

  static void addProductToCart(Product product, int quantity) {
    final itemCartBox = Hive.box<Cart>('Carts');
    String idItem = const Uuid().v1();
    final item = Cart(idItem, product, quantity);
    itemCartBox.put(item.idItem, item);
  }

  static List<Cart> getAllCarts() {
    final itemCartListBox = Hive.box<Cart>('Carts');
    if (itemCartListBox.isNotEmpty) {
      return itemCartListBox.values.toList();
    }
    return [];
  }

  static void updateQuantityInCart({
    required String id,
    required int quantity,
  }) {
    final itemCartListBox = Hive.box<Cart>('Carts');
    Cart? itemCart = itemCartListBox.get(id);
    if (itemCart != null) {
      itemCart.quantity = quantity;
      itemCart.save();
    }
  }

  static bool checkProductIsExists(String idProduct) {
    List<Cart> itemCarts = getAllCarts();
    return itemCarts
        .where((item) => item.product.idProduct == idProduct)
        .isNotEmpty;
  }

  static void deleteAll() {
    final itemCartListBox = Hive.box<Cart>('Carts');
    itemCartListBox.clear();
  }

  static void deleteCart(Cart cart) {
    final itemCartListBox = Hive.box<Cart>('Carts');
    itemCartListBox.delete(cart.idItem);
  }

  static void addAllItemCartList(List<Cart> items) {
    final itemCartListBox = Hive.box<Cart>('Carts');
    itemCartListBox.addAll(items);
  }

  static bool checkCartListExists(List<Cart> dataList) {
    final itemCartListBox = Hive.box<Cart>('Carts');
    final cartList = itemCartListBox.values.toList();
    for (var itemCart in cartList) {
      for (var cart in dataList) {
        if (itemCart.idItem == cart.idItem) {
          return true;
        }
      }
      return false;
    }
    return false;
  }
}
