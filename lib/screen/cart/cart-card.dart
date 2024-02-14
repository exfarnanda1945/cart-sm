import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 8, right: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
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
                  const Text(
                    "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Category: men's clothing",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  const Text(
                    "In Stock: 25",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 14 ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    '\$${"5000"}',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Color(0xff3867d6),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
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
                      const SizedBox(
                        width: 50,
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
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
}
