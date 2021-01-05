import 'package:introduction_screen/introduction_screen.dart';

import './build_image.dart';

// Screen model view
PageViewModel buildScreen(
  PageDecoration pageDecoration,
  String title,
  String body,
  String imageName,
) {
  return PageViewModel(
    title: title,
    body: body,
    image: buildImage(imageName),
    decoration: pageDecoration,
  );
}
