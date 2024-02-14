import 'package:cart_sm/model/product.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable{
  const Cart(
      {required this.id,
      required this.product,
      required this.totalPrice,
      required this.totalCount});

  final String id;
  final Product product;
  final int totalPrice;
  final int totalCount;

  @override
  List<Object?> get props => [id];
}
