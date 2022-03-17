import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final Function onPressed;
  const DrawerListTile(
      {Key? key,
      required this.iconData,
      required this.title,
      this.onPressed = _defaultOnPressed})
      : super(key: key);

  static void _defaultOnPressed() {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      dense: true,
      onTap: () => onPressed,
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
