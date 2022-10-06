import 'package:dio/dio.dart';
import 'package:pokeapi/pages/home/domain/model/home_model.dart';
import 'package:pokeapi/pages/home/domain/model/pokemon_detail_model.dart';

class HomeApiService {
  Future getPokemon() async {
    final data = await Dio().get('https://pokeapi.co/api/v2/pokemon/');
    return Pokemon.fromJson(data.data);
  }

  Future<PokeDetail> getPokemonDetail(String id) async {
    final response = await Dio().get('https://pokeapi.co/api/v2/pokemon/$id');
    return PokeDetail.fromJson(response.data);
  }
}
