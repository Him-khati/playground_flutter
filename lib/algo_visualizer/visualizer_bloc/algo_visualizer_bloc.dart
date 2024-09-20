import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_solver.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_solver/algorithm_visualisation_steps.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/algo_visualizer_runner/visualizer_runner.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/settings/visualizer_settings.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/visualizer_widgets/element_single.dart';
import 'package:meta/meta.dart';

import '../algo_solver/algorithm_visualisation_steps_keeper.dart';
import '../algo_visualizer_runner/visualizer_runner_action_listener.dart';

part 'algo_visualizer_event.dart';
part 'algo_visualizer_state.dart';

class AlgoVisualizerBloc extends Bloc<AlgoVisualizerEvent, AlgoVisualizerState>
    implements VisualizerActionListener {
  //Constants
  static const int maxElementsAllowed = 10;

  //Dependencies
  final AlgorithmSolver algorithmSolver;
  final VisualizerRunner visualizerRunner;
  final VisualizerSettings visualizerSettings;
  final AlgorithmVisualisationStepsKeeper stepsKeeper;

  //Internal Variables
  List<int> _ogList = [];

  AlgoVisualizerBloc({
    required this.algorithmSolver,
    required this.visualizerRunner,
    required this.visualizerSettings,
    required this.stepsKeeper,
  }) : super(Initialized()) {
    _handleUiEvent(this);
    visualizerRunner.setVisualizerActionListener(this);
  }

  void _handleUiEvent(
    AlgoVisualizerBloc bloc,
  ) =>
      bloc
        ..on<LoadDefaultAlgorithm>(_init)
        ..on<ChangeAnimationSpeed>(_onChangeAnimationSpeed)
        ..on<ChangeAnimationSpeed>(_onChangeAnimationSpeed)
        ..on<PlayVisualization>(_onPlayVisualization)
        ..on<PauseVisualization>(_onPauseVisualization)
        ..on<SwapAlgorithm>(_onAlgorithmSwapped)
        ..on<ResetVisualizer>(_onResetVisualizer)
        ..on<StepAnimationForward>(_onStepAnimationForward)
        ..on<StepAnimationBackward>(_onStepAnimationBackward)
        ..on<Restart>(_onRestart)
        ..on<Randomize>(_onRandomize)
        ..on<TickReceivedFromRunner>(_onTickReceivedFromRunner);

  _init(
      LoadDefaultAlgorithm event,
      Emitter<AlgoVisualizerState> emit,
      ) {
    _ogList = List.generate(maxElementsAllowed, (i) => Random().nextInt(12000));
    final listSortingSteps = algorithmSolver.prepareAlgorithmInformation(
      _ogList
    );

    stepsKeeper.setupSteps(listSortingSteps.algorithmSolvingSteps);

  }

  _onAlgorithmSwapped(
    SwapAlgorithm event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onChangeAnimationSpeed(
    ChangeAnimationSpeed event,
    Emitter<AlgoVisualizerState> emit,
  ) async {
    visualizerSettings.updateVisualizerAnimationSpeed(
      event.speed,
    );
    
  }

  _onPlayVisualization(
    PlayVisualization event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {
    visualizerRunner.startVisualization();
  }

  _onPauseVisualization(
    PauseVisualization event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onResetVisualizer(
    ResetVisualizer event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onStepAnimationForward(
    StepAnimationForward event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onStepAnimationBackward(
    StepAnimationBackward event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onRandomize(
    Randomize event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onRestart(
    Restart event,
    Emitter<AlgoVisualizerState> stateEmitter,
  ) {}

  _onTickReceivedFromRunner(
    TickReceivedFromRunner event,
    Emitter<AlgoVisualizerState> emit,
  ) {



  }

  @override
  bool performNextStepAndCheckCompletion() {
    bool stepPresentInForwardDir =
        stepsKeeper.isThereAnyStepPendingInForwardDirection();

    if (!stepPresentInForwardDir) {
      return false;
    }

    final nextStep = stepsKeeper.getNextStepInForwardDirection();
    stepPresentInForwardDir =
        stepsKeeper.isThereAnyStepPendingInForwardDirection();

    add(
      TickReceivedFromRunner(nextStep: nextStep),
    );
    return stepPresentInForwardDir;
  }

  @override
  bool reverseStepAndCheckCompletion() {
    bool stepPresentInReverseDir = stepsKeeper.isThereAnyStepPendingInReverseDirection();

    if (!stepPresentInReverseDir) {
      return false;
    }

    final nextStep = stepsKeeper.getNextStepInReverseDirection();
    stepPresentInReverseDir = stepsKeeper.isThereAnyStepPendingInReverseDirection();

    add(
      TickReceivedFromRunner(nextStep: nextStep),
    );
    return stepPresentInReverseDir;
  }
}
