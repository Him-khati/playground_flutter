part of 'algo_visualizer_bloc.dart';

@immutable
sealed class AlgoVisualizerState {}

final class Initialized extends AlgoVisualizerState {}

final class ElementsUpdated extends AlgoVisualizerState {
  final List<ElementSingle> elements;
  final Duration animDuration;

  ElementsUpdated({
    required this.elements,
    required this.animDuration,
  });
}
