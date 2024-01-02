import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of shoe
  List<Shoe> shoeShop = [
    Shoe(
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/logo-nike.png',
        description: "Hehehe"),
    Shoe(
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/logo-nike.png',
        description: "Hehehe"),
    Shoe(
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/logo-nike.png',
        description: "Hehehe"),
    Shoe(
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/logo-nike.png',
        description: "Hehehe"),
  ];
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

  // Add item to cart
  void addToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // Remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
