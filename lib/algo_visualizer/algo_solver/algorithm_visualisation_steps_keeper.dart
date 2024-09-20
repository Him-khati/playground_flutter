import 'dart:collection';

import 'algorithm_visualisation_steps.dart';

class AlgorithmVisualisationStepsKeeper {
  //Original AlgoSolvingSteps
  LinkedHashSet<AlgorithmSolvingVisualisationStepWithData> algoSolvingSteps =
      LinkedHashSet();

  DoubleLinkedQueue<AlgorithmSolvingVisualisationStepWithData> steps =
      DoubleLinkedQueue();
  DoubleLinkedQueue<AlgorithmSolvingVisualisationStepWithData> spentSteps =
      DoubleLinkedQueue();

  setupSteps(
    LinkedHashSet<AlgorithmSolvingVisualisationStepWithData> algoSolvingSteps,
  ) {
    this.algoSolvingSteps.clear();
    this.algoSolvingSteps.addAll(algoSolvingSteps);

    steps
      ..clear()
      ..addAll(algoSolvingSteps);
    spentSteps.clear();
  }

  AlgorithmSolvingVisualisationStepWithData getNextStepInForwardDirection() {
   return steps.removeLast();
  }

  AlgorithmSolvingVisualisationStepWithData getNextStepInReverseDirection() {
    return spentSteps.removeLast();
  }

  bool isThereAnyStepPendingInForwardDirection(){
   return steps.isNotEmpty;
  }

  bool isThereAnyStepPendingInReverseDirection(){
    return spentSteps.isNotEmpty;
  }

  reset(){
    steps
      ..clear()
      ..addAll(algoSolvingSteps);
    spentSteps.clear();
  }
}
