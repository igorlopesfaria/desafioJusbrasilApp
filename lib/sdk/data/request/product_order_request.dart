class ProductOrderRequest {
  int idProduct;
  int idOrder;

  ProductOrderRequest({this.idProduct, this.idOrder});

  factory ProductOrderRequest.fromJSON(Map<String, dynamic> productResponseJson) {
    return new ProductOrderRequest(
        idProduct: productResponseJson['idProduct'],
        idOrder: productResponseJson['idOrder']);
  }


  toJson() {
    return {
      'idProduct': idProduct,
      'idOrder': idOrder
    };
  }
}
