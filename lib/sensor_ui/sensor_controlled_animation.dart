import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorControlledScreen extends StatefulWidget {
  const SensorControlledScreen({super.key});

  @override
  State<SensorControlledScreen> createState() => _SensorControlledScreenState();
}

class _SensorControlledScreenState extends State<SensorControlledScreen> with WidgetsBindingObserver {

  StreamSubscription<MagnetometerEvent>? subscription;

  @override
  void initState() {
    super.initState();

    subscription = magnetometerEventStream().listen(
      (MagnetometerEvent event) {
        print(event);
      },
      onError: (error) {
        // Logic to handle error
        // Needed for Android in case sensor is not available
      },
      cancelOnError: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription?.cancel();
  }


  
  @override
  Widget build(BuildContext context) {

    return const Placeholder();
  }


}
