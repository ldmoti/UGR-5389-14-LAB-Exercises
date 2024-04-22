
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Counter state class
class CounterState {
  final int count;
  CounterState({required this.count});

  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}

// Counter state notifier
class CounterNotifier extends StateNotifier<CounterState> {
  CounterNotifier() : super(CounterState(count: 0)); 

  void increment() {
    state = state.copyWith(count: state.count + 1);
  }

  void decrement() { 
    state = state.copyWith(count: state.count - 1);
  }
}

// Create a provider for the CounterState
final counterProvider = StateNotifierProvider<CounterNotifier, CounterState>((ref) {
  return CounterNotifier();
}); 