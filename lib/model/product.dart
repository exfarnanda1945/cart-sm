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

  factory Product.fromJson(Map<String, dynamic> json) {
    final price = json["price"].runtimeType == int
        ? (json["price"] as int).toDouble()
        : json["price"];

    final rate = json["rating"]["rate"].runtimeType == int
        ? (json["rating"]["rate"] as int).toDouble()
        : json["rating"]["rate"];

    return Product(
        id: json["id"] as int,
        title: json["title"] as String,
        price: price,
        description: json["description"] as String,
        category: json["category"] as String,
        image: json["image"] as String,
        rate: rate,
        count: json["rating"]["count"] as int);
  }

  @override
  List<Object?> get props => [id];
}
