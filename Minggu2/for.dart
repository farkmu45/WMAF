void main() {
  String? word;

  for (var i = 1; i <= 20; i++) {
    if (i % 3 == 0 && i % 2 == 1)
      word = 'I Love Coding';
    else if (i % 2 == 0)
      word = 'Berkualitas';
    else if (i % 2 == 1) word = 'Santai';

    print('$i - $word');
  }
}
