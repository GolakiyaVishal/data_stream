import 'package:data_stream/data/a1_data.dart';

abstract class A1State {}

class A1Initial extends A1State {}

class A1Loading extends A1State {}

class A1Loaded extends A1State {
  final A1Data data;

  A1Loaded(this.data);
}

class A1Error extends A1State {
  final String message;

  A1Error(this.message);
}
