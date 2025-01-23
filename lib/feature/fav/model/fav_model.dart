class FavModel {
  final String image;
  final num price;
  final String name;
  final String description;
  final String id;
  FavModel(
      {required this.image,
      required this.id,
      required this.price,
      required this.name,
      required this.description});

  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      image: json['image'],
      price: json['price'],
      name: json['name'],
      description: json['description'],
      id: json['_id'],
    );
  }
}
