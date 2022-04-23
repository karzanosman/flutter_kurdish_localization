import 'package:flutter/material.dart';
import 'package:flutter_kurdish_localization/router/route_constants.dart';
import 'package:flutter_kurdish_localization/screens/home_page.dart';

import '../landing.dart';

class CustomRouter {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case landingRoute:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
    }
  }
}
