import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Food extends Equatable{
  @required final int id;
  @required final String name;
  @required final String description;
  @required final double price;

  const Food(this.id, this.name, this.description, this.price);

  @override
  List<Object?> get props => [id,name,description,price];
}