class CakeModel {
  final String? imageUrl;
  final String name;
  final double price;
  final String description;
  final double rate;
  final String time;

  CakeModel({
    this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.rate,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'description': description,
      'rate': rate,
      'time': time,
    };
  }

  factory CakeModel.fromMap(Map<String, dynamic> map) {
    return CakeModel(
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
      description: map['description'],
      rate: map['rate'],
      time: map['time'],
    );
  }
}
