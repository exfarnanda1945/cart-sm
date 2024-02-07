import 'package:equatable/equatable.dart';

class Product extends Equatable {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"] as int,
      title: json["title"] as String,
      price: json["price"] as double,
      description: json["description"] as String,
      category: json["category"] as String,
      image: json["image"] as String,
      rate: json["rate"] as double,
      count: json["count"] as int);

  @override
  List<Object?> get props => [id];
}
