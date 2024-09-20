import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_visualisation_steps.dart';

import 'algorithm.dart';
import 'algorithm_solution/sorting/bubble_sort.dart';

abstract class AlgorithmSolver {

  AlgorithmSolvingVisualisationSteps prepareAlgorithmInformation(
    List<int> data,
  );

  factory AlgorithmSolver(Algorithm algo){
    switch(algo){
      case Algorithm.bubble : return BubbleSortSolver();
      default : throw "$algo is not registered in AlgorithmSolver factory";
    }
  }
}
