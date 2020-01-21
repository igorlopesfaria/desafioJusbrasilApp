class OrderOpenedResponse {
  int id;
  String dateCreated;

  OrderOpenedResponse({this.id, this.dateCreated});

  factory OrderOpenedResponse.fromJSON(Map<String, dynamic> productResponseJson) {
    return new OrderOpenedResponse(
        dateCreated: productResponseJson['dateCreated'],
        id: productResponseJson['id']);
  }
}
