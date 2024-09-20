import 'package:flutter/material.dart';
import 'package:flutter_playground_himanshu/routing/router.dart';

import 'menu_list.dart';

class MenuListTile extends StatefulWidget {
  final MenuItem menu;

  const MenuListTile({
    super.key,
    required this.menu,
  });

  @override
  State<MenuListTile> createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {

  @override
  Widget build(BuildContext context) {
    return makeCard(context,widget.menu,);
  }

  Card makeCard(BuildContext context,MenuItem lesson,) => Card(
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: InkWell(
      onTap: (){
        AppRouter.navigateNamed(lesson.routeDestination);
      },
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(context,lesson,)
      ),
    ),
  );


  ListTile makeListTile(BuildContext context,MenuItem menu,) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.autorenew, color: Colors.white),
      ),
      title: Text(
        menu.title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Flexible(
          child : Text(menu.tags.join(" | "), style: TextStyle(color: Colors.white))
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));


}
