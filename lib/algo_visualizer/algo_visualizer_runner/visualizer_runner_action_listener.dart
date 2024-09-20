abstract class VisualizerActionListener{

  // Perform the next step and return true if the animation is complete
  bool performNextStepAndCheckCompletion();

  // Go back one step and return true if there are no previous steps
  bool reverseStepAndCheckCompletion();
}