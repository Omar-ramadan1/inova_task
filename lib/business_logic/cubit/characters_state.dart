part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class ProductsInitial extends CharactersState {}


class ProductssLoaded extends CharactersState {
  final List<ProductDataModel> characters;

  ProductssLoaded(this.characters);
}


