import 'package:flutter/material.dart';

class FilterProductModel {
  final String name;
  final int quantity;
  final double price;
  final Text description;
  final int stock;
  final DateTime createdAt;
  final DateTime updatedat;
  final DateTime? expiredat;

  FilterProductModel(
      {required this.name,
      required this.quantity,
      required this.price,
      required this.description,
      required this.stock,
      required this.createdAt,
      required this.updatedat,
      this.expiredat});

  factory FilterProductModel.fromJson(Map<String, dynamic> json) {
    return FilterProductModel(
      name: json['name'],
      quantity: json['quantitity'],
      price: json['price'],
      description: json['description'],
      stock: json['stock'],
      createdAt: json['createdat'],
      updatedat: json['updatedat'],
      expiredat: json['expiredat'],
    );
  }
}
