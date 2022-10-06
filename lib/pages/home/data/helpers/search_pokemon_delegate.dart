import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/pages/home/domain/model/home_model.dart';
import 'package:pokeapi/pages/home/presentation/controller/home_controller.dart';
import 'package:pokeapi/routes/app_pages.dart';
import 'package:pokeapi/shared/widgets/card_pokemon.dart';

class SearchPokemonDelegate extends SearchDelegate<PokeList> {
  final List<PokeList> dataList;
  List<PokeList> filter = [];

  SearchPokemonDelegate(this.dataList);
  HomeController controller = Get.find();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    filter = dataList.where((e) {
      return e.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView(children: [
      Wrap(
        spacing: 10,
        runSpacing: 10,
        children: filter
            .map((e) => GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.detailPokemon,
                        parameters: {'id': controller.getId(e.url)});
                  },
                  child: CardPokemon(
                    pokeList: e,
                    controller: controller,
                  ),
                ))
            .toList(),
      )
    ]);
  }
}
