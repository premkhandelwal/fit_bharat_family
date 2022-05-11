part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable{
  @override
  List<Object?> get props => [DateTime.now()];
}

class ProductInitial extends ProductState {}

class FetchAllProductSuccessState extends ProductState {
  final List<Product> prodList;
  FetchAllProductSuccessState({
    required this.prodList,
  });
}

class FetchAllProductFailureState extends ProductState {}

class FetchAllProductInProgressState extends ProductState {}
