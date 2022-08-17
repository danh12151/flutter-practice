part of 'food_bloc.dart';

@immutable
abstract class FoodEvent extends Equatable{
  const FoodEvent();

  @override
  List<Object?> get props => [];

}

class LoadFoodEvent extends FoodEvent{
  final List<Food> foodList;
  //constructor
  const LoadFoodEvent({this.foodList = const <Food>[]});

  @override
  List<Object?> get props => [foodList];
}

class AddFoodEvent extends FoodEvent{
  final Food food;

  const AddFoodEvent({required this.food});
  @override
  List<Object?> get props => [food];
}

class DeleteFoodEvent extends FoodEvent{
  final Food food;

  const DeleteFoodEvent({required this.food});
  @override
  List<Object?> get props => [food];
}

class EditFoodEvent extends FoodEvent{
  final Food food;


  const EditFoodEvent({required this.food});

  @override
  List<Object?> get props => [food];
}
