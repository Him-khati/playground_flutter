import 'package:flutter/material.dart';
import 'package:flutter_playground_himanshu/widgets/menu_list_tile.dart';

class MenuItem {
  AnimatedIconData icon;
  String title;
  List<String> tags;
  String routeDestination;

  MenuItem(
    this.icon,
    this.title,
    this.tags,
    this.routeDestination,
  );
}

class MenuList extends StatelessWidget {
  final List<MenuItem> menu;

  const MenuList({
    required this.menu,
    super.key,
  });

  List<MenuListTile> get menuTiles {
    return menu.map((m) {
      return MenuListTile(menu: m);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: menuTiles,
    );
  }
}
