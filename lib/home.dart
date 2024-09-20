import 'package:flutter/material.dart';
import 'package:flutter_playground_himanshu/widgets/menu_list.dart';
import 'package:flutter_playground_himanshu/widgets/menu_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Flutter Playground"),
      ),
      body: MenuList(menu: menu),
    );
  }

  List<MenuItem> get menu {
    return [
      MenuItem(
        AnimatedIcons.add_event,
        "Algorithm Visualizer",
        ["Algorithm", "Animation"],
        "algo_visualizer"
      ),
      MenuItem(
          AnimatedIcons.add_event,
          "Games",
          ["Algorithm", "Flame"],
          ""
      ),
      MenuItem(
          AnimatedIcons.add_event,
          "Custom Widgets",
          ["Widget", "Animation"],
          ""
      ),
      MenuItem(
          AnimatedIcons.add_event,
          "Sensors",
          ["Sensor", "Animation"],
          "sensor_home"
      )
    ];
  }
}
