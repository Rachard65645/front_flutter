part of 'stores_bloc.dart';

@immutable
sealed class StoresEvent {}

final class FetchStoreEvent extends StoresEvent {}