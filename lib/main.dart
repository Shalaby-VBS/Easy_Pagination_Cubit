import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_cubit/ui/home_screen.dart';

import 'logic/pagination_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagination Cubit',
      home: BlocProvider(
        create: (BuildContext context) => PaginationCubit()..fetchItems(),
        child: const HomeScreen(),
      ),
    );
  }
}
