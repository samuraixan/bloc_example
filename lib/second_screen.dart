import 'package:bloc_example/second/second_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Second Screen'),
      ),
      body: Container(
        child: BlocBuilder<SecondBloc, SecondState>(
          builder: (context, state) {
            if (state is SecondInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is SecondLoadedState) {
              return _info(state);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  _info(state) {
    return Column(
      children: [
        Text('Идентификатор: ${state.item.id}'),
        Text('Заголовок: ${state.item.title}'),
        Text('Сщщбщение: ${state.item.body}'),
      ],
    );
  }
}
