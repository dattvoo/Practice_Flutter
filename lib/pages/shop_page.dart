import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Search
      Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Search",
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
            )
          ],
        ),
      ),
      // Message
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Text(
            'Every one file... some fly longer than others',
            style: TextStyle(color: Colors.grey[600]),
          )),
      // Hot picks
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "HOT PICKS",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                "See all",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
              )
            ]),
      ),
      // List Items
      Expanded(
          child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Shoe shoe = Shoe(
              name: "Nike 1",
              price: "3000",
              imagePath: "lib/images/logo-nike.png",
              description: "Heheheheheheh");
          return ShoeTile(
            shoe: shoe,
          );
        },
      )),
      const Padding(
        padding: EdgeInsets.only(top: 25, left: 25, right: 25),
        child: Divider(
          color: Colors.white,
        ),
      )
    ]);
  }
}
