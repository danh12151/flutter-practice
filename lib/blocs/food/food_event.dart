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

  const AddFoodEvent(this.food);
}

class DeleteFoodEvent extends FoodEvent{
  final Food food;

  const DeleteFoodEvent(this.food);
}
