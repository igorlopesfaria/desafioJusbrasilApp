import 'package:bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/bloc/product_list_events.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/bloc/product_list_states.dart';
import 'package:desafio_jusbrasil_app/sdk/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductListBloc extends Bloc<ProductListEvents, ProductListStates> {
  final ProductRepository productRepository;

  ProductListBloc({@required this.productRepository})
      : assert(productRepository != null);

  @override
  ProductListStates get initialState => ProductListStart();

  @override
  Stream<ProductListStates> mapEventToState(ProductListEvents event) async* {
    if (event is FetchProduct) {
      yield ProductListLoading();
      try {
        final listProduct = (await productRepository.fetchProductRepository())
            .map(((value) => ProductModel(value)))
            .toList();

        if (listProduct.isNotEmpty)
          yield ProductListLoaded(listProduct: listProduct);
        else
          yield ProductListEmpty();
      } catch (exception) {
        print(exception);
        yield ProductListError();
      }
    }
  }
}
