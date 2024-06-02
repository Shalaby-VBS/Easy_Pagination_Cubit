import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginationCubit extends Cubit<List<dynamic>> {
  PaginationCubit() : super([]);

  int _page = 1;
  bool _isFetching = false;

  Future<void> fetchItems() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      final response = await Dio().get(
          'https://jsonplaceholder.typicode.com/posts',
          queryParameters: {'_page': _page, '_limit': 10});
      final List<dynamic> items = response.data;
      emit(List.from(state)..addAll(items));
      _page++;
      debugPrint('Page: $_page');
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      debugPrint('Total Fetched Items Num: ${state.length}');
      _isFetching = false;
    }
  }
}
