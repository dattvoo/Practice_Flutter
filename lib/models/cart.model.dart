import 'package:ecommerce_app/models/shoe.model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  // List of shoe
  List<Shoe> shoeShop = [
    Shoe(
        id: 1,
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/item-1.jpg',
        description:
            "This is considered an error condition because it indicates that there is content that cannot be seen"),
    Shoe(
        id: 2,
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/item-2.png',
        description: "Hehehe"),
    Shoe(
        id: 3,
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/item-3.jpg',
        description: "Hehehe"),
    Shoe(
        id: 4,
        name: "Product 1",
        price: "200",
        imagePath: 'lib/images/item-4.jpg',
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
