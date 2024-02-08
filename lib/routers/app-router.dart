import 'package:cart_sm/model/product.dart';
import 'package:cart_sm/screen/detail-product/detail-product.dart';
import 'package:cart_sm/screen/home/home-screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(routes: [
  GoRoute(
    path: "/",
    name: "home",
    builder: (context, state) {
      return const HomeScreen();
    },
  ),
  GoRoute(
    path: "/detail",
    name: "detail",
    builder: (context, state) {
      final product=state.extra! as Product;
      return DetailProduct(product: product);
    },
  ),
]);
