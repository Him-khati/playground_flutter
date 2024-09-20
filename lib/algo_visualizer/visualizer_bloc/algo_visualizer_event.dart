part of 'algo_visualizer_bloc.dart';

sealed class AlgoVisualizerEvent {}

class LoadDefaultAlgorithm extends AlgoVisualizerEvent{}

// Event for starting the sorting algorithm
class SwapAlgorithm extends AlgoVisualizerEvent {
  final Algorithm algorithm;

  SwapAlgorithm({
    required this.algorithm,
  });
}

// Event for starting the sorting algorithm
class ChangeAnimationSpeed extends AlgoVisualizerEvent {
  final VisualizerSpeed speed;

  ChangeAnimationSpeed({
    required this.speed,
  });
}

// Event for starting the sorting algorithm
class PlayVisualization extends AlgoVisualizerEvent {}

// Event for pausing the visualization (optional, if needed)
class PauseVisualization extends AlgoVisualizerEvent {}

// Event for resetting the visualizer
class ResetVisualizer extends AlgoVisualizerEvent {}

// Event for resetting the visualizer
class StepAnimationForward extends AlgoVisualizerEvent {}

// Event for resetting the visualizer
class StepAnimationBackward extends AlgoVisualizerEvent {}

// Event for resetting the visualizer
class Restart extends AlgoVisualizerEvent {}

// Event for resetting the visualizer
class Randomize extends AlgoVisualizerEvent {}

// Event for resetting the visualizer
class TickReceivedFromRunner extends AlgoVisualizerEvent {
  final AlgorithmSolvingVisualisationStepWithData nextStep;

  TickReceivedFromRunner({
    required this.nextStep,
  });
}
