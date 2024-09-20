import 'package:flutter/cupertino.dart';
import 'package:flutter_playground_himanshu/sensor_ui/sensor_controlled_animation.dart';
import 'package:go_router/go_router.dart';

import '../../list_experiment.dart';
import '../../test_widget.dart';

final List<GoRoute> sensorSubPackageRoutes = [
  GoRoute(
    name: "sensor_home",
    path: 'sensor_home',
    builder: (BuildContext context, GoRouterState state) {
      return  ListExperiment();
    },
  ),
];
