import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdp_quiz_app/core/route/app_route_name.dart';
import 'package:pdp_quiz_app/pages/creat_accaunt_page.dart';
import 'package:pdp_quiz_app/pages/email_otp_page.dart';
import 'package:pdp_quiz_app/pages/home_page.dart';
import 'package:pdp_quiz_app/pages/pin_code_page.dart';
import 'package:pdp_quiz_app/pages/splash_page.dart';

final class GoRouteSystem {
  static GoRouter router = GoRouter(
    initialLocation: AppRouteName.splashPage,
    routes: [
      GoRoute(
        path: AppRouteName.splashPage,
        builder: (context, state) => const SplashPage(),
        routes: [
          GoRoute(
            path: AppRouteName.emailOtpPage,
            builder: (context, state) => const EmailOtpPage(),
            routes: [
              GoRoute(
                path: AppRouteName.createAccauntPage,
                builder: (context, state) => const CreateAccauntPage(),
              ),
            ],
          ),
        ],
      ),
      ShellRoute(
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
            path: "/${AppRouteName.homePage}",
            builder: (context, state) => const HomePage(child: Center(child: Text('Welcome to Home Page'))),
          ),
          GoRoute(
            path: "/${AppRouteName.createAccauntPage}",
            builder: (context, state) => const CreateAccauntPage(),
          ),
          GoRoute(
            path: "/${AppRouteName.pinCodePage}",
            builder: (context, state) => const PinCodePage(),
          ),
          GoRoute(
            path: "/${AppRouteName.emailOtpPage}",
            builder: (context, state) => const EmailOtpPage(),
          ),
        ],
      ),
    ],
  );
}