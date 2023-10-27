import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/second/model/item_post.dart';
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';

part 'second_event.dart';
part 'second_state.dart';

class SecondBloc extends Bloc<SecondEvent, SecondState> {
  ItemPost? post;

  SecondBloc() : super(SecondInitial()) {
    on<SecondEvent>((event, emit) async {
      if (event is LoadSecondEvent) {
        emit(SecondInitial());
        post = await _fetch(event.id);
        emit(SecondLoadedState(post!));
      }
    });
  }

  Future<ItemPost> _fetch(id) async {
    final client = BasicAuthClient('', '');
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    return ItemPost.fromJson(jsonDecode(response.body));
  }
}
