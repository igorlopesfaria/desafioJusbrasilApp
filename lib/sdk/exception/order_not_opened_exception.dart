class OrderNotOpenedException implements Exception {
  String cause;
  OrderNotOpenedException(this.cause);
}