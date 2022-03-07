void main() async {
  print('Ready. Sing');
  await line();
  await line2();
  await line3();
  await line4();
}

Future<void> line() => Future.delayed(
      Duration(seconds: 5),
      () => print('pernahkan kau merasa'),
    );

Future<void> line2() => Future.delayed(
      Duration(seconds: 3),
      () => print('pernahkan kau merasa.....'),
    );

Future<void> line3() => Future.delayed(
      Duration(seconds: 2),
      () => print('pernahkah kau merasa.....'),
    );

Future<void> line4() => Future.delayed(
      Duration(seconds: 1),
      () => print('Hatimu hampa, pernahkah kau merasa hati mu kosong....'),
    );
