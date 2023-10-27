import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';

import 'model/item_user.dart';

part 'first_event.dart';
part 'first_state.dart';

class FirstBloc extends Bloc<FirstEvent, FirstState> {
  List<ItemUser> items = [];
  int page = 0;

  FirstBloc() : super(FirstInitialState()) {
    on<FirstEvent>((event, emit) async {
      if(event is FirstInitialEvent) {
        emit(FirstInitialState());
        for (int i = 1; i < 7; i++) {
          page = i;
          await _fetch(page);
          emit(FirstLoadedState(items));
        }
      }
      if (event is AddFirstEvent) {
        await _fetch(++page);
        emit(FirstLoadedState(items));
      }
    });
  }

  Future _fetch(page) async {
    final client = BasicAuthClient('', '');
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/comments/$page'));
    final result = ItemUser.fromJson(jsonDecode(response.body));
    items.add(result);
  }
}
