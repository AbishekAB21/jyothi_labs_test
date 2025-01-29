class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price; 
  double totalPrice;
  int quantity;
  final int stock;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
    required this.quantity,
    required this.stock,
  }) : totalPrice = price;

  factory Product.fromJson(Map<String, dynamic> json) {
    double parsedPrice = (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'];
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: parsedPrice,
      quantity: 1,
      stock: json['stock'],
    );
  }
}