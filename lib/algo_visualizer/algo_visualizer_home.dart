import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_solution/sorting/bubble_sort.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_visualisation_steps_keeper.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_visualizer_runner/visualizer_runner.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/settings/visualizer_settings.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/visualizer_bloc/algo_visualizer_bloc.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/visualizer_widet.dart';

class AlgoVisualizerHomeScreen extends StatelessWidget {
  const AlgoVisualizerHomeScreen({super.key});

  Widget get initializingWidget => const Center(
        child: Text("Initializing"),
      );

  @override
  Widget build(BuildContext context) {
    final setting = VisualizerSettings.instance;

    return BlocProvider(
      create: (_) => AlgoVisualizerBloc(
        algorithmSolver: BubbleSortSolver(),
        visualizerRunner: VisualizerRunner(setting: setting),
        visualizerSettings: setting,
        stepsKeeper: AlgorithmVisualisationStepsKeeper(),
      )..add(LoadDefaultAlgorithm()),
      child: BlocBuilder<AlgoVisualizerBloc, AlgoVisualizerState>(
        builder: (BuildContext context, state) {
          if (state is Initialized) {
            return initializingWidget;
          } else if (state is ElementsUpdated) {
            return VisualizerWidget(
                key: const Key("visualizer"),
                elements: state.elements, animationDuration: state.animDuration);
          } else{
            throw "State not handled $state";
          }
        },
      ),
    );
  }
}
