import 'package:cart_sm/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CartCard extends ConsumerStatefulWidget {
  const CartCard({super.key, required this.cart});

  final Cart cart;

  @override
  ConsumerState<CartCard> createState() => _CartCardState();
}

class _CartCardState extends ConsumerState<CartCard> {
  late TextEditingController countController;


  @override
  void initState() {
    super.initState();
    countController =
        TextEditingController(text: widget.cart.totalCount.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.cart.product.image,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              width: 5,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.cart.product.title,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Category: ${widget.cart.product.category}",
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${widget.cart.totalCount * widget.cart.product.price}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xff3867d6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            updateCart(ref);
                          },
                          icon: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xff2ed573),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Icon(
                                Icons.add,
                                size: 24,
                                color: Colors.white,
                              ))),
                       SizedBox(
                        width: 50,
                        child: TextField(
                          controller: countController,
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          enabled: false,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Container(
                              decoration: const BoxDecoration(
                                  color: Color(0xffff4757),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: const Icon(
                                Icons.remove,
                                size: 24,
                                color: Colors.white,
                              ))),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateCart(WidgetRef ref) {
    // final updatedCart = Cart(id: widget.cart.id, product: widget.cart.product, totalPrice: , totalCount: totalCount)
  }
}
