enum VisualizerSpeed { slow, medium, fast }

final Map<VisualizerSpeed, Duration> visualizerSpeedToAnimationDurationMap = {
  VisualizerSpeed.slow: const Duration(milliseconds: 1200),
  VisualizerSpeed.medium: const Duration(milliseconds: 800),
  VisualizerSpeed.fast: const Duration(milliseconds: 400),
};

class VisualizerSettings {
  VisualizerSettings._privateConstructor();
  static final VisualizerSettings _instance =
      VisualizerSettings._privateConstructor();
  static VisualizerSettings get instance => _instance;

  Duration _visualizerAnimationDuration =
      visualizerSpeedToAnimationDurationMap[VisualizerSpeed.medium]!;

  Duration getAnimationDuration() {
    return _visualizerAnimationDuration;
  }

  updateVisualizerAnimationSpeed(VisualizerSpeed speed) {
    _visualizerAnimationDuration = visualizerSpeedToAnimationDurationMap[speed]!;
  }
}
