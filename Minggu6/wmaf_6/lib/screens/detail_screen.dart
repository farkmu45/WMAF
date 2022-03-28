import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  final String imageUrl;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('123'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.white, Colors.black, color],
          ),
        ),
        child: Center(
          child: ClipOval(
            child: SizedBox(
              width: 200,
              height: 300,
              child: Material(
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Ink.image(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
