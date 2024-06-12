import 'package:flutter/material.dart';
import 'package:pdp_quiz_app/UI/pages/auth/auth_page/creat_accaunt_page.dart';
import 'package:pdp_quiz_app/UI/pages/auth/auth_page/email_otp_page.dart';
import 'package:pdp_quiz_app/UI/pages/auth/auth_page/pin_code_page.dart';
import 'package:pdp_quiz_app/core/common_widgets/splash_page.dart';
import 'app_route_name.dart';

@immutable
final class AppRoute<T extends Object?> {
  const AppRoute();

  Route<T> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.splashPage:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
          settings: settings,
        );
      case AppRouteName.emailOtpPage:
        return MaterialPageRoute(
          builder: (context) => const EmailOtpPage(),
          settings: settings,
        );
      case AppRouteName.createAccauntPage:
        return MaterialPageRoute(
          builder: (context) => const CreateAccauntPage(),
          settings: settings,
        );
      case AppRouteName.pinCodePage:
        return MaterialPageRoute(
          builder: (context) => const PinCodePage(),
          settings: settings,
        );
      default:
        return _errorRoute();
    }
  }

  Route<T> _errorRoute() => MaterialPageRoute<T>(
        builder: (context) => Scaffold(
          body: Center(
            child: Text(
              'Error Route',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ),
        ),
      );
}
