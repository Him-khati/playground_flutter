import 'package:flutter/material.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/visualizer_widgets/box_element_item_widget.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/visualizer_widgets/element_single.dart';

class VisualizerWidget extends StatelessWidget {
  final Duration animationDuration;
  final List<ElementSingle> elements;

  const VisualizerWidget({
    super.key,
    required this.elements,
    required this.animationDuration
  });

  @override
  Widget build(BuildContext context) {

    final innerWidgets = elements.map((e){
      return BoxElementItemWidget(
        key: ValueKey(e.getId()),
        animationDuration: animationDuration,
        elementData: e,
      );
    }).toList();

    return Stack(
      key: const Key("visualizer_stack"),
      children: innerWidgets,
    );
  }
}
