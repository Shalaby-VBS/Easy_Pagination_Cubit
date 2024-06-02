import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/pagination_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagination Cubit'),
      ),
      body: BlocBuilder<PaginationCubit, List<dynamic>>(
        builder: (context, items) {
          return ListView.builder(
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index == items.length) {
                context.read<PaginationCubit>().fetchItems();
                return const Center(
                  child: LinearProgressIndicator(minHeight: 4),
                );
              } else {
                return ListTile(
                  title: Text(items[index]['title']),
                  subtitle: Text(items[index]['body']),
                  leading: Text('${items[index]['id']}'),
                );
              }
            },
          );
        },
      ),
    );
  }
}
