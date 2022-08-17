import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/blocs/food/food_bloc.dart';
import 'package:flutter_practice/models/food.dart';
import 'package:flutter_practice/screens/create_new_food.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite Food"),
        actions: [
          IconButton(
              onPressed: () {
                //handle add food

                Navigator.of(context).push(
                  MaterialPageRoute(builder: (builder) => CreateNewFood())
                );
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: BlocBuilder<FoodBloc, FoodState>(
        builder: (context, state) {
          if (state is FoodLoading){
            return const CircularProgressIndicator();
          }
          if (state is FoodLoaded){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text(
                        "All My favorite foods are:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.foodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _foodCard(context, state.foodList[index]);
                    },

                  )
                ],
              ),
            );
          }
          else{
            return const Text("Something went wrong!");
          }
        },
      ),
    );
  }
}

Card _foodCard(BuildContext context, Food food) {
  return Card(
    margin: const EdgeInsets.only(bottom: 8.0),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("${food.id} ${food.name}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 18)),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<FoodBloc>().add(DeleteFoodEvent(food));
                  },
                  icon: const Icon(Icons.delete)),
            ],
          )
        ],
      ),
    ),
  );
}
