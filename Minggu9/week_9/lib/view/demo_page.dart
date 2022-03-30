import 'package:flutter/material.dart';
import 'package:week_9/controller/demo_controller.dart';
import 'package:get/get.dart';

class DemoPage extends StatelessWidget {
  final DemoController ctrl = Get.find();

  DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(Get.arguments),
            ),
            SwitchListTile(
              value: ctrl.isDark,
              onChanged: ctrl.changeTheme,
              title: const Text('Touch to change ThemeMode'),
            ),
            ElevatedButton(
              onPressed: () => Get.snackbar(
                  'Snackbar', 'Hello this is the snackbar message',
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: Colors.white,
                  backgroundColor: Colors.black87),
              child: const Text('Snack Bar'),
            ),
            ElevatedButton(
              onPressed: () => Get.defaultDialog(
                title: 'Dialogue',
                content: const Text('Hey, From Dialogue'),
              ),
              child: const Text('Dialogue'),
            ),
            ElevatedButton(
              onPressed: () => Get.bottomSheet(
                Container(
                  height: 150,
                  color: Colors.white,
                  child: const Text('Hello from bottom sheet'),
                ),
              ),
              child: const Text('Bottom sheet'),
            ),
            ElevatedButton(
              onPressed: () => Get.offNamed('/'),
              child: const Text('Back to home'),
            )
          ],
        ),
      ),
    );
  }
}
