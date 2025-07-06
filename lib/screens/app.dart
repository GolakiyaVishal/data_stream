import 'package:data_stream/data/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/a1_cubit.dart';
import 'screen_1.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stream Caching App',
      home: BlocProvider(
        create: (_) => A1Cubit(DataRepository())..load(),
        child: const Screen1(),
      ),
    );
  }
}
