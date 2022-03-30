import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:week_9/model/product.dart';

class DemoController extends GetxController {
  RxList<Product> cartItems = <Product>[].obs;
  RxInt test = 1.obs;

  int get cartCount => cartItems.length;
  double get totalAmount =>
      cartItems.fold(0.0, (sum, element) => sum + element.price);

  final storage = GetStorage();
  bool get isDark => storage.read('darkmode') ?? false;

  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();

  void addToCart(Product product) {
    cartItems.add(product);
    test++;
    update();
  }

  void changeTheme(bool val) {
    storage.write('darkmode', val);
  }
}
