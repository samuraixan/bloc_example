import 'package:bloc_example/second/second_bloc.dart';
import 'package:bloc_example/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import 'first/first_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('First Screen'),
      ),
      body: BlocBuilder<FirstBloc, FirstState>(
        builder: (context, state) {
          if (state is FirstInitialState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FirstLoadedState) {
            return _scrollView(context, state);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _scrollView(context, state) {
    final FirstBloc bloc = BlocProvider.of<FirstBloc>(context);
    return LazyLoadScrollView(child: ListView.builder(
      itemCount: state.items.length,
        itemBuilder: (BuildContext context, int index) {
        return _itemsElement(context, state.items[index]);
        }),
        onEndOfPage: () {
      bloc.add(AddFirstEvent());
        });
  }

  _itemsElement(context, element) {
    final SecondBloc bloc = BlocProvider.of<SecondBloc>(context);
    return GestureDetector(
      onTap: () {
        bloc.add(LoadSecondEvent(element.id));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SecondScreen()));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Container(
          child: ListTile(
            title: Text(element.name.toString()),
            subtitle: Text(element.body.toString()),
            leading: CircleAvatar(child: Text(element.id.toString())),
          ),
        ),
      ),
    );
  }
}
