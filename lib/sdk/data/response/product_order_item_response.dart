class ProductOrderItemResponse {
  int idProduct;
  int idOrder;
  double priceProduct;
  int quantity;
  String imagePathProduct;
  String nameProduct;

  ProductOrderItemResponse({this.idProduct, this.idOrder, this.priceProduct, this.nameProduct, this.imagePathProduct, this.quantity});

  factory ProductOrderItemResponse.fromJSON(Map<String, dynamic> productResponseJson) {
    return new ProductOrderItemResponse(
        idProduct: productResponseJson['idProduct'],
        idOrder: productResponseJson['idOrder'],
        priceProduct: productResponseJson['productPrice'],
        nameProduct: productResponseJson['productName'],
        imagePathProduct: productResponseJson['productImagePath'],
        quantity: productResponseJson['quantity']);
  }
}
