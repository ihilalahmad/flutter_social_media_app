import 'package:flutter/material.dart';
import 'package:tech_media/utils/routes/route_name.dart';
import 'package:tech_media/view/auth_screens/login_screen.dart';
import 'package:tech_media/view/auth_screens/register_screen.dart';
import 'package:tech_media/view/home_screen.dart';
import 'package:tech_media/view/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case AppRouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppRouteName.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AppRouteName.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());

      case AppRouteName.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
