import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:week_9/controller/demo_controller.dart';
import 'package:week_9/controller/purchase.dart';

class Home extends StatelessWidget {
  final purchase = Get.put(Purchase());
  final DemoController cart = Get.find();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      bottomSheet: SafeArea(
        child: Card(
          elevation: 12.0,
          margin: EdgeInsets.zero,
          child: Container(
            height: 65.0,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart_rounded,
                        size: 40.0,
                        color: Colors.white,
                      ),
                      Positioned(
                        right: 5,
                        child: Container(
                          height: 20.0,
                          width: 20.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: Center(
                              child: Obx(() => Text(
                                    '${cart.cartCount}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.0),
                                  ))),
                        ),
                      )
                    ],
                  ),
                  Obx(
                    () => Text(
                      'Total Amount - ${cart.totalAmount}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.toNamed('/cart',
                        arguments:
                            'Homepage to Demo Page -> Passing arguments'),
                    icon: const Icon(Icons.arrow_forward_ios_rounded),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: purchase.products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: Column(
                  children: [
                    Image.network(
                      'https://img.alicdn.com/tfs/TB1e.XyReL2gK0jSZFmXXc7iXXa-990-400.png',
                      fit: BoxFit.cover,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  purchase.products[index].productName,
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                                Text(
                                  purchase.products[index].productDescription,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () =>
                                cart.addToCart(purchase.products[index]),
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
