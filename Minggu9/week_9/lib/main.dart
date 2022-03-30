import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:week_9/controller/demo_controller.dart';
import 'package:week_9/view/demo_page.dart';
import 'package:week_9/view/home.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final DemoController ctrl = Get.put(DemoController());
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleBuilder(builder: (_) {
      return GetMaterialApp(
        title: 'GetX',
        theme: ctrl.theme,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {'/': (context) => Home(), '/cart': (context) => DemoPage()},
      );
    });
  }
}
