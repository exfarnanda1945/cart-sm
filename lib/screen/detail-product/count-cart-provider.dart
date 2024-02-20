import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'count-cart-provider.g.dart';

@riverpod
class CountCartProvider extends _$CountCartProvider {
  @override
  int build() {
    return 1;
  }

  void increment(int maxProduct) {
    if (state < maxProduct) {
      state++;
    }
  }

  void decrement() {
    if (state > 1) {
      state--;
    }
  }
}
