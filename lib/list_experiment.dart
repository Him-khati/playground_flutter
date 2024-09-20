import 'dart:math';

import 'package:flutter/material.dart';

class ListExperiment extends StatefulWidget {
  ListExperiment({super.key});

  @override
  State<ListExperiment> createState() => _ListExperimentState();
}

class _ListExperimentState extends State<ListExperiment> {
  final List<String> items = List<String>.generate(
    10,
        (i) => i % 6 == 0 ? 'Heading $i' : 'Sender $i',
  );

  @override
  Widget build(BuildContext context) {
    const title = 'Mixed List';

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          // Assign a unique ValueKey based on the item
          return HeadingItem(
            key: ValueKey(item), // Key based on the content of the item
            heading: item,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            items[2] = "Updated Sender ${Random.secure().nextDouble()}";
          });
        },
      ),
    );
  }
}

/// A ListItem that contains data to display a heading.
class HeadingItem extends StatelessWidget {
  final String heading;
  HeadingItem({required this.heading, super.key});

  @override
  Widget build(BuildContext context) {
    print("build Called");
    return Text(
      heading,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}