import 'dart:ffi';

class ProductResponse {
  int id;
  String name;
  String description;
  String imagePath;
  double price;

  ProductResponse({this.id, this.name, this.description, this.imagePath, this.price});

  factory ProductResponse.fromJSON(Map<String, dynamic> productResponseJson) {
    return new ProductResponse(
        id: productResponseJson['id'],
        name: productResponseJson['name'],
        description: productResponseJson['description'],
        imagePath: productResponseJson['imagePath'],
        price: productResponseJson['price']);
  }
}
