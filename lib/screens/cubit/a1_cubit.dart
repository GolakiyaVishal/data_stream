import 'dart:async';

import 'package:data_stream/data/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'a1_state.dart';

class A1Cubit extends Cubit<A1State> {
  final DataRepository repo;
  late final StreamSubscription _sub;

  A1Cubit(this.repo) : super(A1Initial()) {
    _sub = repo.a1Stream.listen((data) {
      emit(A1Loaded(data));
    }, onError: (e) {
      emit(A1Error(e.toString()));
    });
  }

  void load({bool force = false}) async {
    emit(A1Loading());
    try {
      await repo.fetchA1(forceRefresh: force);
    } catch (e) {
      emit(A1Error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}