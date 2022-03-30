import 'package:week_9/model/product.dart';

import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Purchase extends GetxController {
  var products = <Product>[].obs();

  @override
  void onInit() async {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    var serverResponse = [
      Product(
          id: 1,
          productName: 'Demo Product',
          productImage: 'aby',
          productDescription:
              'This is a Product that we are going to show by getX',
          price: 300.0),
      Product(
          id: 1,
          productName: 'Demo Product',
          productImage: 'aby',
          productDescription:
              'This is a Product that we are going to show by getX',
          price: 300.0),
      Product(
          id: 1,
          productName: 'Demo Product',
          productImage: 'aby',
          productDescription:
              'This is a Product that we are going to show by getX',
          price: 300.0),
      Product(
          id: 1,
          productName: 'Demo Product',
          productImage: 'aby',
          productDescription:
              'This is a Product that we are going to show by getX',
          price: 300.0),
      Product(
          id: 1,
          productName: 'Demo Product',
          productImage: 'aby',
          productDescription:
              'This is a Product that we are going to show by getX',
          price: 300.0),
      Product(
          id: 1,
          productName: 'Demo Product',
          productImage: 'aby',
          productDescription:
              'This is a Product that we are going to show by getX',
          price: 300.0),
    ];

    products.addAll(serverResponse);
  }
}
