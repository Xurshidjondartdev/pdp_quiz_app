import 'package:flutter/material.dart';
import 'package:pdp_quiz_app/core/route/go_route_systeam.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: GoRouteSystem.router.routerDelegate,
    );
  }
}
