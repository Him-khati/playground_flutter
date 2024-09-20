import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Swap Items with Animation")),
        body: ItemSwapList(),
      ),
    );
  }
}

class ItemSwapList extends StatefulWidget {
  @override
  _ItemSwapListState createState() => _ItemSwapListState();
}

class _ItemSwapListState extends State<ItemSwapList> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<int> _items = List.generate(10, (index) => index); // Create a list with 10 items.

  void _swapItems(int index1, int index2) {
    setState(() {
      final item1 = _items.removeAt(index1); // Remove item at index1
      _items.insert(index2, item1); // Insert item1 at index2

      // Rebuild the list with animation
      _listKey.currentState?.removeItem(
        index1,
            (context, animation) => _buildItem(context, index1, animation),
      );

      _listKey.currentState?.insertItem(index2);
    });
  }

  Widget _buildItem(BuildContext context, int index, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Card(
        child: ListTile(
          title: Text('Item ${_items[index]}'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return _buildItem(context, index, animation);
            },
          ),
        ),
        ElevatedButton(
          onPressed: () => _swapItems(1, 3), // Swap item at index 1 with index 3
          child: Text('Swap Item 1 and 3'),
        ),
      ],
    );
  }
}
