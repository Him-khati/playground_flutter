import 'package:flutter/material.dart';

import 'data_element_actions.dart';
import 'element_single.dart';

class BoxElementItemWidget extends StatelessWidget {
  final ElementSingle elementData;
  final Duration animationDuration;

  const BoxElementItemWidget({
    super.key,
    required this.elementData,
    required this.animationDuration,
  });

  Color get backgroundColor {
    return Colors.grey;
  }

  double get height {
    return 50;
  }

  double get left {
    return elementData.index * (width + paddingBetweenItems);
  }

  double get width {
    return 50;
  }

  double get paddingBetweenItems {
    return 50;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        left: left,
        height: height,
        width: width,
        duration: animationDuration,
        curve: Curves.easeIn,
        child: ColoredBox(color: backgroundColor)
    );
  }
}
