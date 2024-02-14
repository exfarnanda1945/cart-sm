import 'package:cart_sm/model/cart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart-provider.g.dart';

@riverpod
class CartProvider extends _$CartProvider {
  @override
  List<Cart> build() {
    return [];
  }

  void addToCart(Cart cart) {
    state.add(cart);
  }

  void removeFromCart(Cart cart) {
    state.removeWhere((item) => item.id == cart.id);
  }

  void editCart(Cart cart) {
    final indexCart = state.indexWhere((item) => item.id == cart.id);
    if (indexCart != -1) {
      state[indexCart] = cart;
    }
  }
}
