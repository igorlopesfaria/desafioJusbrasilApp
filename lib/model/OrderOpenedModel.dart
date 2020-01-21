import 'package:desafio_jusbrasil_app/sdk/data/response/order_opened_response.dart';

class OrderOpenedModel{
  int id;
  String dateCreated;

  OrderOpenedModel(OrderOpenedResponse response){
    this.id = response.id;
    this.dateCreated = response.dateCreated;
  }
}