class Product {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price; 
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
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      thumbnail: json['thumbnail'],
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : json['price'], // Convert to double
      quantity: 1,
      stock: json['stock'],
    );
  }
}