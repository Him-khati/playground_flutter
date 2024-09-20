import 'dart:collection';

import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_visualisation_steps.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_solver.dart';


class BubbleSortSolver implements AlgorithmSolver {
  @override
  AlgorithmSolvingVisualisationSteps prepareAlgorithmInformation(List<int> data) {
    final algorithmSteps = getSortingStepsInVisualization(data);

    return AlgorithmSolvingVisualisationSteps(
      algorithmName: "Bubble Sort",
      algorithmSolvingSteps: algorithmSteps,
    );
  }

  LinkedHashSet<AlgorithmSolvingVisualisationStepWithData> getSortingStepsInVisualization(
    List<int> data,
  ) {
    final steps = LinkedHashSet<AlgorithmSolvingVisualisationStepWithData>();

    steps.add(
        AlgorithmSolvingVisualisationStepWithData(
          step: AlgorithmSolvingVisualisationStep.layElements,
          data: data
        )
    );

    final n = data.length;
    final a = data.toList();

    swap(int i, int j){
      int temp = a[i];
      a[j] = a[i];
      a[i] = temp;
    }

    for (int i = 0; i < n; i++) {

      for (int j = 0; j < n - 1; j++) {
        // Swap adjacent elements if they are in decreasing order
        steps.add(
            AlgorithmSolvingVisualisationStepWithData(
                step: AlgorithmSolvingVisualisationStep.selectElements,
                data: [j, j+1]
            )
        );

        if (a[j] > a[j + 1]) {
          swap(a[j], a[j + 1]);

          steps.add(
              AlgorithmSolvingVisualisationStepWithData(
                  step: AlgorithmSolvingVisualisationStep.swapElements,
                  data: [j, j+1]
              )
          );
        }

        steps.add(
            AlgorithmSolvingVisualisationStepWithData(
                step: AlgorithmSolvingVisualisationStep.unselectElements,
                data: [j, j+1]
            )
        );
      }

      steps.add(
          AlgorithmSolvingVisualisationStepWithData(
              step: AlgorithmSolvingVisualisationStep.markElementSorted,
              data: [i]
          )
      );
    }

    return steps;
  }
}
