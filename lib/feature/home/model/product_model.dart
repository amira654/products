import 'package:flutter_application_2/feature/home/model/rating_model.dart';

class ProductModel{
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel rating;

  ProductModel({required this.id, required this.title, required this.price, required this.description, required this.category, required this.image, required this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
    
  }
}