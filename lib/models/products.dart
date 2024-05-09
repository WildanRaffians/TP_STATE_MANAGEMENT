import 'dart:convert';

List<Products> productsFromJson(String str) => 
List<Products>.from(
  json.decode(str).map(
    (x) => Products.fromJson(x)
  )
);

class Products {
  final int id;
  final String title;
  final dynamic price;
  final String category;
  final String description;
  final String image;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
      id: json["id"],
      title: json["title"],
      price: json["price"],
      category: json["category"],
      description: json["description"],
      image: json["image"],
    );
}
