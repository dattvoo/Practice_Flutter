import 'dart:convert';

import 'package:ecommerce_app/components/shoe_tile.dart';
import 'package:ecommerce_app/components/skeleton.dart';
import 'package:ecommerce_app/models/cart.model.dart';
import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ShopPage extends StatefulWidget {
  bool _isLoading = false;
  ShopPage({super.key});
  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  Future fetchAlbum() async {
    try {
      setState(() {
        widget._isLoading = true;
      });
      final response = await http.get(Uri.parse(
          'https://63f57b5a3f99f5855dc218a1.mockapi.io/shoppingcart'));

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> shoeMaps =
            (json.decode(response.body) as List).cast<Map<String, dynamic>>();
        List<Shoe> shoes = shoeMaps.map((map) => Shoe.fromJson(map)).toList();

        // Update shoeShop in Cart model
        Provider.of<Cart>(context, listen: false).updateShoeShop(shoes);
      } else {
        throw Exception('Failed to load album');
      }
    } catch (error) {
      print('Error fetching data: $error');
    } finally {
      setState(() {
        widget._isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Call the API when the widget is first initialized
    fetchAlbum();
  }

  void addToCart(Shoe shoe) {
    // Add shoe to cart
    Provider.of<Cart>(context, listen: false).addToCart(shoe);
    // Alert when user add to cart success.
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Successfully added',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Check your cart'),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(children: [
              // Search
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 18),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ]),
              ),

              // List Items
              widget._isLoading
                  ? Skeleton()
                  : Container(
                      height: 600,
                      child: Expanded(
                          child: ListView.builder(
                        itemCount: value.getShoeList().length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Shoe shoe = value.getShoeList()[index];
                          return ShoeTile(
                            shoe: shoe,
                            onTap: () => addToCart(shoe),
                          );
                        },
                      )),
                    ),
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Divider(
                  color: Colors.white,
                ),
              ),
            ]));
  }
}
