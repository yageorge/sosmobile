import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/sharedPrefs.dart';
import '../services/providers/courses_provider.dart';
import '../views/splash_screen.dart';

import '../views/home/home.dart';
import '../views/intro/intro.dart';
import '../views/auth/auth.dart';

class AppRouter extends StatelessWidget {
  static const routeName = '/approuter';
  @override
  Widget build(BuildContext context) {
    sharedPrefs.deviceHeight = MediaQuery.of(context).size.height;
    sharedPrefs.deviceWidth = MediaQuery.of(context).size.width;
    sharedPrefs.apiUrl = "http://10.0.2.2:8000/api/";
    sharedPrefs.userToken =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNTNiOTQ3NjYyMTVhOTJlNzdhM2I1ZmIxNDg2ZDE2MjU2MWE2OTRlYTZjNDFhZDRkNDE4OTA0NWRkMDAyYzdlNjQ1NGQ4NjQ3ZWZjNmU4YTEiLCJpYXQiOiIxNjA5NjEzNDI3Ljc0MjIzMSIsIm5iZiI6IjE2MDk2MTM0MjcuNzQyMjQxIiwiZXhwIjoiMTY0MTE0OTQyNy41MjE4NTEiLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.KRb7vjlwmLlZLOgHvAYk4GPfK4qb-Z3gEoWoOQv9vs6aiBkfHwAv-8g4iwXibFDOpdCujTqHK-EeooD1UZsSyYxT-BjQNRhgoR6X64bVsBWcXb6KQj27RYXDxTL8PE3vqvnxsRgcKotIKBKhi7Yq59cFi49a8427HenlSzYZ5qIvptrxVUMZ6mRVuRr745ov6naB2h3TExSq9ziEf-xR5ebBCBcdaGk3JgR3dyyI3nY48QqywJ-e9Pxpa_2c1Qq0AFZCvVXPiqbJShfOuUwXZc3IMbB0VKzqkPkySSR7cbUpMltYiVhywDp1JLZ80-I3nExbYLAaxbWSSIj_offv59fvQ2dj3wUjC-iJ21oe9C8ekaqBpk7md4T0ZMkkvmaMDjX2mg7RE6335f8IHaRyoPUE_e4jSp2HtiWUm8MIKjrwK53CyorhciY0f7eRw8AWFKzZO4yBKNxO8FDc4JFEGRs-DmxDENdkXyxtWJ0YThu4ShryYsd1gXmVFqsJenON2gJrpqAB8vpTgCNm3hhDgBnTyOrLMHCBcDP--qZlqa95dmUSz37EvSY1Hs2Qywtd3tC9ebttseByylZkpXRHEiqp2R6bsFFsvlfKNAV3EXjisU8Ci-N_0s3IkdxnEUNaWqplKaJAEQyDsxuyqKGJbLn2AFNBmu4p4gqOcN-YMWk";
    sharedPrefs.userId = 1;

    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (r) => false);
    });

    return SplashScreen();
  }
}
