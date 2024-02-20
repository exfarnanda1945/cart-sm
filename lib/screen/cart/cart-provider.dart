import 'package:cart_sm/model/cart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart-provider.g.dart';

@riverpod
class CartProvider extends _$CartProvider  {
  @override
  List<Cart> build() {
    return [];
  }

  void addToCart(Cart cart) {
    state = [...state, cart];
  }

  void removeFromCart(Cart cart) {
    state.removeWhere((item) => item.id == cart.id);
  }

  void editCart(Cart cart) {
    final carts = state;
    final updatingIndex = carts.indexOf(cart);
    if (updatingIndex != -1) {
      carts[updatingIndex] = cart;
    }

    state= carts;
  }

  int getCountCart() {
    return state.length;
  }
}
