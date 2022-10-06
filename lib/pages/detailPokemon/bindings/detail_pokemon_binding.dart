import 'package:get/get.dart';
import 'package:pokeapi/pages/detailPokemon/presentation/controller/detail_pokemon_controller.dart';

class DetailPokemonBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPokemonController>(() => DetailPokemonController());
  }
}
