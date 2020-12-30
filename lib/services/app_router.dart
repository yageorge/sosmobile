import 'package:flutter/material.dart';

import '../services/sharedPrefs.dart';
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
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZTY3NzY2NjFkYjA5OTdkMzdlNDExZWViYzJhODFjODNhNWIxODBmMWExN2Q1ODNlZjI1Y2I4OWZmZDBlMTkxM2RiODA2NTY4MmU5ZDJlNmYiLCJpYXQiOiIxNjA5MzU1NDAxLjA2NTkzMyIsIm5iZiI6IjE2MDkzNTU0MDEuMDY1OTQwIiwiZXhwIjoiMTY0MDg5MTQwMS4wNjA1NjIiLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.TkJcCsKuH-IJun1q39LtvOltffQfgnvCdTi-EVRZUEV3PJPs_RfDnHKnagKKhBwl31lnmOYpCQe_BZh4Vc4R6NyH5CbsAo6bD38FpZ1FxyGdi8o-dCdUchbz6NwRU6eKqjRjIDJVTlJOwZSUptCX1QbCqWkXmE6QlVylcsIn_AsGsZ-Yz0eVj52rbwU6OSClIIKf6Ns0pO_gfoJU9GpwJ7oJOfFFtXMFVTCFEZeJuA7ZshMj0TrR7_YjpPWQc8xXV7R7TaitLaApyhi5PVWf3GCEwAK-Dq4UWIYXGrrCs1zn5Xyk2Qdisgxn9MB5tKpJiHhR142Ym0w_nTRicOmYGE25x2SsZYaQKcXSB64t7j67scaU0ftYEAb60xVa6gUitSdwQ9eXzYqFo356RjeBANmZ1y5MgFGFqDsHCIp1c214U0yWxbsadY54LdMoHDq5_ROYUbYiJoUOaPrbwRAUman7yu1dW6BTPClUDRcI2sP_4BVPb6O4-NS8RdiipuOWkYF-a8aSGTmh1ZAl5PBSq56vOJQQi01JqLgy6aOt43MIGJkYwBQG-d5gSaCs_R1SBmBDd_SG_nbm41WIpqiB1nUjud6mAQ_5Wu2mR1f_JlYbqnUeKVDMJhIS-o2cKjuDS28DBjdkPonIyoKutW_1BwVSNS7OVgio0bQGg9AkttA";

    Future.delayed(const Duration(milliseconds: 700), () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (r) => false);
    });

    return SplashScreen();
  }
}
