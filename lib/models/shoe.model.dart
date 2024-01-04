class Shoe {
  // Variable
  final String? id;
  final String name;
  final String price;
  final String imagePath;
  final String description;

  List<Shoe> listShoe = [];

  // Contructor
  Shoe(
      {this.id,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.description});
  // Factory method to create a Shoe instance from JSON
  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      id: json['id'] as String?,
      name: json['name'] as String,
      price: json['price'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
    );
  }
  // Method to convert a Shoe instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'description': description,
    };
  }
}
