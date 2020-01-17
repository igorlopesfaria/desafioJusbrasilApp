import 'dart:ffi';

class ProductResponse {
  int id;
  String name;
  String description;
  String urlImagePath;
  double price;

  ProductResponse({this.id, this.name, this.description, this.urlImagePath, this.price});

  factory ProductResponse.fromJSON(Map<String, dynamic> productResponseJson) {
    return new ProductResponse(
        id: productResponseJson['id'],
        name: productResponseJson['name'],
        description: productResponseJson['description'],
        urlImagePath: productResponseJson['urlImagePath'],
        price: productResponseJson['price']);
  }
}
