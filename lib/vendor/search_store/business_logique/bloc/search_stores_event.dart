part of 'search_stores_bloc.dart';

@immutable
sealed class SearchStoresEvent {}
final class SearchAllStoresEvent extends  SearchStoresEvent {
  final String? name;
  final String? address;

  SearchAllStoresEvent({ this.name,  this.address});
}