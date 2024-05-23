import 'package:flutter/material.dart';
import 'package:melon_app/src/screens/choose_character_screen.dart';
import 'package:melon_app/src/screens/choose_machine_screen.dart';
import 'package:melon_app/src/screens/choose_mods_screen.dart';
import 'package:melon_app/src/screens/home_screen.dart';
import 'package:melon_app/src/screens/onboarding_screens.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ChooseModScreen.route:
        return MaterialPageRoute(builder: (context) => ChooseModScreen());
      case ChooseCharacterScreen.route:
        return MaterialPageRoute(builder: (context) => ChooseCharacterScreen());
      case ChooseMachineScreen.route:
        return MaterialPageRoute(builder: (context) => ChooseMachineScreen());
      case OnboardingScreeen.route:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreeen());
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => ChooseModScreen());
    }
  }
}
