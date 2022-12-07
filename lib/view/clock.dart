import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class Clock extends StateNotifier<int> {
  // 1. initialize with current time

  Clock() : super(30) {
    // 2. create a timer that fires every second

    timer = Timer.periodic(Duration(seconds: 1), (_) {
      // 3. update the state with the current time

      state = state - 1;
    });
  }
  Timer restart() {
    timer.cancel();
    return timer;
  }

  late final Timer timer;

  // 4. cancel the timer when finished
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

// Note: StateNotifierProvider has *two* type annotations

final clockProvider = StateNotifierProvider<Clock, int>((ref) {
  return Clock();
});

class ClockWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch the StateNotifierProvider to return a DateTime (the state)

    final currentTime = ref.watch(clockProvider);

    // format the time as `hh:mm:ss`

    return Column(
      children: [
        Text("$currentTime"),
        ElevatedButton(
            onPressed: () {
              ref.read(clockProvider.notifier).timer;
            },
            child: Text("Click Me")),
        ElevatedButton(
            onPressed: () {
              ref.read(clockProvider.notifier).dispose();
              ref.read(clockProvider.notifier).timer;
            },
            child: Text("Restart")),
      ],
    );
  }
}
