import 'dart:convert';

import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [];

  // List of item in user cart
  List<Shoe> userCart = [];
  // Get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // Get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  Future<void> addToCart(Shoe shoe) async {
    // Convert the Shoe object to a Map
    final shoeMap = shoe.toJson();
    final jsonData = {
      "cartItems": [
        {
          "id": shoeMap['id'],
          "name": shoeMap['name'],
          "price": shoeMap['price'],
          "quantity": 1, // Assuming the default quantity is 1
          "imagePath": shoeMap['imagePath'],
        }
      ]
    };
    try {
      // Make a POST request with the shoeMap as the body
      final response = await http.put(
        Uri.parse('https://63f57b5a3f99f5855dc218a1.mockapi.io/carts/1'),
        body: jsonEncode(jsonData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        userCart.add(shoe);
        notifyListeners();
      } else {
        // If the request failed, you might want to handle the error accordingly
        print(
            'Failed to add item to cart. Status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle other types of errors (e.g., network error)
      print('Error adding item to cart: $error');
    }
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

  int getTotalMoney() {
    int money = 0;
    for (Shoe shoe in userCart) {
      money += int.parse(shoe.price);
    }
    return money;
  }

  void updateShoeShop(List<Shoe> shoes) {
    shoeShop = shoes;
    notifyListeners();
  }
}
