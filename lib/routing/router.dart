import 'package:flutter/material.dart';
import 'package:flutter_playground_himanshu/home.dart';
import 'package:flutter_playground_himanshu/routing/routes/home_screen_routes.dart';
import 'package:flutter_playground_himanshu/routing/routes/sensor_animation_routes.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter goRouter = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomeScreen();
        },
        routes: <RouteBase>[
          ...sensorSubPackageRoutes,
          ...homeScreenRoutes
        ],
      ),
    ],
  );


  static navigateNamed(String name){
    goRouter.goNamed(name);
  }
}
