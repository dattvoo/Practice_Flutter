import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePath),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("x1"), Text("200")]),
        ),
      ),
    );
  }
}
