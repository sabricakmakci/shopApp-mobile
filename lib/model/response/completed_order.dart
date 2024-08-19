class CompletedOrder {
  final String name;
  final String size;
  final double price;
  final String status;
  final String image;

  CompletedOrder({
    required this.name,
    required this.size,
    required this.price,
    required this.status,
    required this.image,
  });

  // JSON'dan CompletedOrder nesnesi oluşturmak için bir factory method
  factory CompletedOrder.fromJson(Map<String, dynamic> json) {
    return CompletedOrder(
      name: json['name'],
      size: json['size'].toDouble(), // JSON'dan gelen boyutu double'a çevir
      price: json['price'].toDouble(), // JSON'dan gelen fiyatı double'a çevir
      status: json['status'],
      image: json['image'],
    );
  }

  // CompletedOrder nesnesini JSON'a dönüştürmek için bir method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'size': size,
      'price': price,
      'status': status,
      'image': image,
    };
  }
}
