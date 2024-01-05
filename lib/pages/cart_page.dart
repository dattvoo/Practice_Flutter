import 'package:ecommerce_app/components/cart_item.dart';
import 'package:ecommerce_app/models/cart.model.dart';
import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(top: 250),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // Heading
                      const Center(
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 600,
                        child: ListView.builder(
                          itemCount: value.getUserCart().length,
                          itemBuilder: (context, index) {
                            // Get individual shoe
                            Shoe userCart = value.getUserCart()[index];
                            // return the cart item
                            return CartItem(shoe: userCart);
                          },
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Sub-total: ",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            value.getTotalMoney().toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.black),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
