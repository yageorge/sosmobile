import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import './widgets/build_screen.dart';
import '../auth/auth.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  // Intro screens key
  final introKey = GlobalKey<IntroductionScreenState>();

  // Exit intro + navigate to next screen
  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => Auth()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Style and design
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.teal,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        buildScreen(
          pageDecoration,
          'Screen 1 Titles',
          'Instead of having to buy an entire share, invest any amount you want.',
          'intro_1.png',
        ),
        buildScreen(
          pageDecoration,
          'Screen 2 Title',
          'Instead of having to buy an entire share, invest any amount you want.',
          'intro_2.png',
        ),
        buildScreen(
          pageDecoration,
          'Screen 3 Title',
          'Instead of having to buy an entire share, invest any amount you want.',
          'intro_3.jpg',
        ),
        buildScreen(
          pageDecoration,
          'Screen 4 Title',
          'Instead of having to buy an entire share, invest any amount you want.',
          'intro_4.png',
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
