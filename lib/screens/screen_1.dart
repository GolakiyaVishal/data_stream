
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/a1_cubit.dart';
import 'cubit/a1_state.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<A1Cubit>();
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: BlocBuilder<A1Cubit, A1State>(
          builder: (context, state) {
            if (state is A1Loading) return const CircularProgressIndicator();
            if (state is A1Error) return Text('Error: ${state.message}');
            if (state is A1Loaded) return Text('A1 Message: ${state.data.message}');
            return const Text('Initializing...');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => cubit.load(force: true),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}