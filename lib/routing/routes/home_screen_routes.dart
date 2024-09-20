
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../algo_visualizer/algo_visualizer_home.dart';

final List<GoRoute> homeScreenRoutes = [
  GoRoute(
    name: "algo_visualizer",
    path: 'algo_visualizer',
    builder: (BuildContext context, GoRouterState state) {
      return const AlgoVisualizerHomeScreen();
    },
  ),
];