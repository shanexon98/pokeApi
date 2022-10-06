import 'package:get/get.dart';
import 'package:pokeapi/pages/favoritePokemon/presentation/controller/favorite_pokemon_controller.dart';

class FavoritePokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritePokemonController>(() => FavoritePokemonController());
  }
}
