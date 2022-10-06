import 'package:get/get.dart';
import 'package:pokeapi/pages/detailPokemon/bindings/detail_pokemon_binding.dart';
import 'package:pokeapi/pages/detailPokemon/presentation/views/detail_pokemon_view.dart';
import 'package:pokeapi/pages/favoritePokemon/bindings/favorite_pokemon_binding.dart';
import 'package:pokeapi/pages/favoritePokemon/presentation/views/favorite_pokemon_view.dart';
import 'package:pokeapi/pages/home/bindings/home_binding.dart';
import 'package:pokeapi/pages/home/presentation/views/home_view.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.home,
        page: () => const HomeView(),
        transition: Transition.native,
        binding: HomeBinding()),
    GetPage(
        name: Routes.detailPokemon,
        page: () => const DetailPokemonView(),
        transition: Transition.native,
        binding: DetailPokemonBinding()),
    GetPage(
        name: Routes.favorites,
        page: () => const FavoritePokemonView(),
        transition: Transition.native,
        binding: FavoritePokemonBinding()),
  ];
}
