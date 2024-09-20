import 'dart:collection';

enum AlgorithmSolvingVisualisationStep {
  layElements,
  selectElements,
  unselectElements,
  markElementSorted,
  markElementUnSorted,
  swapElements
}

class AlgorithmSolvingVisualisationStepWithData {
  final AlgorithmSolvingVisualisationStep step;
  final List<int> data;

  AlgorithmSolvingVisualisationStepWithData({
    required this.step,
    required this.data,
  });
}

class AlgorithmSolvingVisualisationSteps {
  LinkedHashSet<AlgorithmSolvingVisualisationStepWithData>algorithmSolvingSteps;
  String algorithmName;

  AlgorithmSolvingVisualisationSteps({
    required this.algorithmName,
    required this.algorithmSolvingSteps,
  });
}
