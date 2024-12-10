part of 'search_stores_bloc.dart';

@immutable
sealed class SearchStoresState {
  final List<SearchModel>? search;

  const SearchStoresState({this.search});
}

final class SearchStoresInitial extends SearchStoresState {}

final class SearchStoreLoading extends SearchStoresState {}

final class SearchStoreSuccess extends SearchStoresState {
  const SearchStoreSuccess({required super.search});
}

final class SearchStoreFailure extends SearchStoresState {
  final String message;

 const  SearchStoreFailure({required this.message});
}
