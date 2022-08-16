part of 'food_bloc.dart';

@immutable
abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object?> get props => [];
}

class FoodLoading extends FoodState {

}


class FoodLoaded extends FoodState {
  //
  final List<Food> foodList;
  //constructor
  const FoodLoaded({this.foodList = const <Food>[]});

  @override
  List<Object?> get props => [foodList];
}