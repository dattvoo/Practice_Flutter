import 'package:ecommerce_app/models/shoe.model.dart';

class Cart {
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
  // Add item to cart
  // Remove item from cart
}
