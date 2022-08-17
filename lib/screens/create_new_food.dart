import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/blocs/food/food_bloc.dart';
import 'package:flutter_practice/models/food.dart';

class CreateNewFood extends StatefulWidget {
  const CreateNewFood({Key? key}) : super(key: key);

  @override
  State<CreateNewFood> createState() => _CreateNewFoodState();
}

class _CreateNewFoodState extends State<CreateNewFood> {
  final TextEditingController _idTextEditingController =
  TextEditingController();
  final TextEditingController _nameTextEditingController =
  TextEditingController();
  final TextEditingController _descriptionTextEditingController =
  TextEditingController();
  final TextEditingController _priceTextEditingController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new food"),
      ),
      body: BlocListener<FoodBloc, FoodState>(
        listener: (context, state) {
          if(state is FoodLoaded){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added Food Successfully!")));
          }
        },
        child: Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _inputField("id", _idTextEditingController),
                _inputField("name", _nameTextEditingController),
                _inputField("description", _descriptionTextEditingController),
                _inputField("price", _priceTextEditingController),
                ElevatedButton(
                    onPressed: () {
                      var food = Food(
                          int.parse(_idTextEditingController.value.text),
                          _nameTextEditingController.value.text,
                          _descriptionTextEditingController.value.text,
                          double.parse(_priceTextEditingController.value.text)
                      );
                      context.read<FoodBloc>().add(AddFoodEvent(food));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(primary: Theme
                        .of(context)
                        .primaryColor),
                    child: const Text("Add Food"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Column _inputField(String label, TextEditingController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Container(
        margin: const EdgeInsets.all(8.0),
        width: double.infinity,
        height: 30,
        child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter field';
            }
            return null;
          },
        ),
      )
    ],
  );
}
