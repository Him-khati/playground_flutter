import 'package:flutter/material.dart';

class SwapListExample extends StatefulWidget {
  @override
  _SwapListExampleState createState() => _SwapListExampleState();
}

class _SwapListExampleState extends State<SwapListExample> {
  List<int> _items = List.generate(5, (index) => index); // List of items

  // Swap function to swap two items in the list
  void _swapItems(int index1, int index2) {
    setState(() {
      int temp = _items[index1];
      _items[index1] = _items[index2];
      _items[index2] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swapping List Animation")),
      body: Column(
        children: _buildAnimatedList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example swap between two specific items
          _swapItems(1, 3);
        },
        child: Icon(Icons.swap_horiz),
      ),
    );
  }

  // This function builds a list of animated widgets
  List<Widget> _buildAnimatedList() {
    return List<Widget>.generate(_items.length, (index) {
      return AnimatedContainer(
        key: ValueKey(_items[index]),
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(vertical: 10.0), // Spacing for the animation
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: () {
            // On tap, swap with the next item
            if (index < _items.length - 1) {
              _swapItems(index, index + 1);
            }
          },
          child: Container(
            color: Colors.blueAccent,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              "Item ${_items[index]}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );
    });
  }
}
