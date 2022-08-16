import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_practice/models/food.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodLoading()) {
    on<LoadFoodEvent>(_onLoadFood);
    on<AddFoodEvent>((event, emit) {

    });
    on<DeleteFoodEvent>((event, emit) {

    });

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
  void _onDeleteFood(DeleteFoodEvent event, Emitter<FoodState> emitter){

  }
}
