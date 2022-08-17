import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_practice/models/food.dart';
import 'package:flutter/material.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodLoading()) {
    on<LoadFoodEvent>(_onLoadFood);
    on<AddFoodEvent>(_onAddFood);
    on<DeleteFoodEvent>(_onDeleteFood);

  }

  void _onLoadFood(LoadFoodEvent event, Emitter<FoodState> emit){
    emit(FoodLoaded(foodList: event.foodList));
  }
  void _onAddFood(AddFoodEvent event, Emitter<FoodState> emit){
    final state = this.state;
    if (state is FoodLoaded){
      emit(FoodLoaded(foodList: List.from(state.foodList)..add(event.food) ));
    }
  }
  void _onDeleteFood(DeleteFoodEvent event, Emitter<FoodState> emit){
    final state = this.state;
    if (state is FoodLoaded){
      List<Food> foodList =  state.foodList.where((food) => food.id != event.food.id).toList();
      emit(FoodLoaded(foodList: foodList));
    }
  }
}
