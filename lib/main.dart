import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/screens/home_screen.dart';

import 'blocs/food/food_bloc.dart';
import 'models/food.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodBloc()..add(LoadFoodEvent(foodList: [
          const Food(1, "Banh Mi", "is a bread", 5000),
          const Food(2, "Pho", "is a noodle dish", 40000),
        ])))
      ],
      child: MaterialApp(
        title: 'Flutter Demo Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.black38,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

