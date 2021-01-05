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
    const bodyStyle = TextStyle(fontSize: 16.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFFFFFF),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        buildScreen(
          pageDecoration,
          'Skill Optimizer',
          'A digital learning platform, every company Needs!',
          'intro_1.png',
        ),
        buildScreen(
          pageDecoration,
          'Create Customized Material!',
          'Create and allocate internal crafted training modules and courses',
          'intro_2.png',
        ),
        buildScreen(
          pageDecoration,
          'Completed Modules Linked to KPIs',
          'Set Points to courses and trainings, and use them to generate KPIs',
          'intro_3.jpg',
        ),
        buildScreen(
          pageDecoration,
          'On-The-Go Access!',
          'Employees can access their training modules and courses on-the-go. IOS / Android apps',
          'intro_4.png',
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(color: Colors.teal),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.teal,
      ),
      done: const Text('Done',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.teal,
          )),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Colors.teal,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
