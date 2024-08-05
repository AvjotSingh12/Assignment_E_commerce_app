class Product {
  final String title;
  final String image;
  final String description;
  final String brand;
  final double price;
  final double rating;

  Product({
    required this.brand,
    required this.rating,
    required this.title,
    required this.image,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand']??'',
      rating: json['rating'].toDouble(),
      title: json['title'],
      image: json['thumbnail'], // Adjust if using a different field for image
      description: json['description'],
      price: json['price'].toDouble(),
    );
  }
}
