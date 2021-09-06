class Item{
  final int id;
  final String category;
  final String image;
  final String description;
  final int price;

  Item(
    this.id,
    this.category,
    this.image,
    this.description,
    this.price
  );

  Item.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    category = json['category'],
    image = json['image'],
    description = json['description'],
    price = json['price'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'category': category,
    'image': image,
    'description': description,
    'price': price,
  };
}