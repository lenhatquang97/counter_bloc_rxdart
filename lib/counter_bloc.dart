import 'package:counter_bloc/counter_model.dart';
import 'package:rxdart/rxdart.dart';

class CounterBloc {
  final _counter = CounterModel(value: 0);
  late BehaviorSubject<CounterModel> _counterRx;
  CounterBloc() {
    _counterRx = BehaviorSubject<CounterModel>.seeded(_counter);
  }
  Stream<CounterModel> get counter => _counterRx.stream;
  void increment() async {
    _counter.value = _counter.value! + 1;
    _counterRx.sink.add(_counter);
  }

  void decrement() async {
    _counter.value = _counter.value! - 1;
    _counterRx.sink.add(_counter);
  }

  dispose() {
    _counterRx.close();
  }
}

final bloc = CounterBloc();
