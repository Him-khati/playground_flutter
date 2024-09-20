import 'dart:async';

import 'package:flutter_playground_himanshu/algo_visualizer/algo_visualizer_runner/visualizer_runner_action_listener.dart';
import 'package:flutter_playground_himanshu/algo_visualizer/settings/visualizer_settings.dart';

class VisualizerRunner {
  final VisualizerSettings _visualizerSettings;
  VisualizerActionListener? _visualizerActionListener;
  Timer? _timer;


  VisualizerRunner({
    required VisualizerSettings setting,
  }) : _visualizerSettings = setting;

  ensureActionListener() {
    if (_visualizerActionListener == null) {
      throw """"visualizerActionListener is not initialized,
      make sure to call setVisualizerActionListener() before""";
    }
  }

  void setVisualizerActionListener(VisualizerActionListener listener) {
    _visualizerActionListener = listener;
  }

  Duration getAnimationDuration() {
    return _visualizerSettings.getAnimationDuration();
  }

  // Starts the visualizer animation
  void startVisualization(){
    _startTimer();
  }

  // Stops the visualizer animation
  void stopVisualization(){
    _stopTimer();
  }

  // Moves animation forward one step
  void stepForward() {
    performNextStepAndCheckCompletion();
  }

  // Moves animation backward one step
  void stepBackward() {
    reverseStepAndCheckCompletion();
  }

  // Perform the next step and return true if the animation is complete
  bool performNextStepAndCheckCompletion() {
    ensureActionListener();
    return _visualizerActionListener!.performNextStepAndCheckCompletion();
  }

  // Go back one step and return true if there are no previous steps
  bool reverseStepAndCheckCompletion() {
    ensureActionListener();
    return _visualizerActionListener!.reverseStepAndCheckCompletion();
  }

  _startTimer() {
    if (_timer != null && _timer!.isActive) {
      print("_startTimer : no-op, timer already active");
      return;
    }

    _timer = Timer(
      getAnimationDuration(),
      _onTimerTick,
    );
  }

  void _onTimerTick() {
    final noFurtherSteps = performNextStepAndCheckCompletion();
    if (noFurtherSteps) {
      _stopTimer();
    }
  }

  _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
