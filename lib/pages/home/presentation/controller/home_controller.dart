import 'package:get/get.dart';
import 'package:pokeapi/pages/home/data/services/home_api_service.dart';
import 'package:pokeapi/pages/home/domain/model/pokemon_detail_model.dart';

import '../../domain/model/home_model.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getPokemon();
  }

  HomeApiService homeApiService = HomeApiService();

  List<PokeList> dataList = [];

  late Pokemon pokemon;

  bool isLoading = true;

  Future getPokemon() async {
    pokemon = await homeApiService.getPokemon();
    dataList = pokemon.results;

    isLoading = false;
    update(['pokemonLoading']);
  }

  Future<PokeDetail> getDetail(String url) async {
    return await homeApiService.getPokemonDetail(getId(url));
  }

  getId(String url) {
    List item = url.split("/");
    String id = item[item.length - 2];
    return id;
  }
}
