import 'dart:math';
import 'package:photo_galery/models/photo.dart';

List<Photo> generatePhoto() {
  return List<Photo>.generate(
    10,
    (counter) {
      int random(min, max) => min + Random().nextInt(max - min);
      return Photo("https://picsum.photos/id/${random(1, 1000)}/800/1200.jpg");
    },
  );
}
