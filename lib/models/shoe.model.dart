class Shoe {
  // Variable
  final int? id;
  final String name;
  final String price;
  final String imagePath;
  final String description;

  // Contructor
  Shoe(
      {this.id,
      required this.name,
      required this.price,
      required this.imagePath,
      required this.description});
}
