import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fit_bharat_family/data/models/product.dart';
import 'package:meta/meta.dart';

import 'package:fit_bharat_family/data/providers/product_provider.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductProvider productProvider;

  ProductBloc({required this.productProvider}) : super(ProductInitial()) {
    on<FetchAllProducts>((event, emit) async{
      emit(FetchAllProductInProgressState());
      List<Product>? _prodList = await productProvider.fetchAllProducts();
      if(_prodList != null) {
        emit(FetchAllProductSuccessState(prodList: _prodList));
      }else{
        emit(FetchAllProductFailureState());
      }
    });
  }
}
