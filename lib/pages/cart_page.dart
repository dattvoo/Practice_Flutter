import 'package:ecommerce_app/components/cart_item.dart';
import 'package:ecommerce_app/models/cart.model.dart';
import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  // Heading
                  const Text(
                    'My Cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Expanded(
                      child: ListView.builder(
                          itemCount: value.getUserCart().length,
                          itemBuilder: (context, index) {
                            // Get individual shoe
                            Shoe userCart = value.getUserCart()[index];
                            // return the cart item
                            return CartItem(shoe: userCart);
                          }))
                ],
              ),
            ));
  }
}
