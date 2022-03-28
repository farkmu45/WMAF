import 'package:flutter/material.dart';
import 'package:wmaf_6/screens/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const _images = [
    "https://picsum.photos/200?random=1",
    "https://picsum.photos/200?random=2",
    "https://picsum.photos/200?random=3",
    "https://picsum.photos/200?random=4",
    "https://picsum.photos/200?random=5",
    "https://picsum.photos/200?random=6",
    "https://picsum.photos/200?random=7"
  ];

  static const _colors = {
    'chimy': Color(0xFF2DB569),
    'cooky': Color(0xFFF86B8),
    'koya': Color(0xFF45CAF5),
    'mang': Color(0xFFB19ECB),
    'rj': Color(0xFFF58E4C),
    'shooky': Color(0xFF46C1BE),
    'tata': Color(0xFFFFEA0E),
    'van': Color(0xFFDBE4E9)
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.purple, Colors.deepPurple],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
          ),
        ),
        child: PageView.builder(
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 50.0,
              ),
              child: Material(
                elevation: 8.0,
                child: Hero(
                  tag: _images[index],
                  child: Material(
                    color: _colors.values.elementAt(index),
                    elevation: 8.0,
                    child: InkWell(
                      child: Ink.image(
                        image: NetworkImage(_images[index]),
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              imageUrl: _images[index],
                              color: _colors.values.elementAt(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          }),
          controller: PageController(viewportFraction: 0.8),
          itemCount: _images.length,
        ),
      ),
    );
  }
}
