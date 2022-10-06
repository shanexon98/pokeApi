import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/pages/home/data/helpers/search_pokemon_delegate.dart';
import 'package:pokeapi/pages/home/presentation/controller/home_controller.dart';
import 'package:pokeapi/routes/app_pages.dart';
import 'package:pokeapi/shared/widgets/card_pokemon.dart';

import 'package:pokeapi/shared/widgets/layout_widget.dart';
import 'package:pokeapi/shared/widgets/text_default_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return Layout(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextDefault(
          sizeText: 32,
          colorText: Colors.black,
          text: 'Pokemones',
          fontWeight: FontWeight.w700,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  showSearch(
                      context: context,
                      delegate: SearchPokemonDelegate(controller.dataList));
                },
                child: Container(
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0, top: 12),
                      child: TextDefault(
                          sizeText: 15,
                          colorText: Colors.grey,
                          text: 'Busca un pokemon'),
                    ))),
            const SizedBox(width: 15),
            ElevatedButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchPokemonDelegate(controller.dataList));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(100, 47),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // <-- Radius
                  ),
                  primary: const Color(0xffEF4444)),
              child: const TextDefault(
                sizeText: 16,
                colorText: Colors.white,
                text: 'BUSCAR',
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        const SizedBox(height: 15),
        Expanded(
          child: GetBuilder<HomeController>(
              id: 'pokemonLoading',
              builder: (_) {
                if (_.isLoading) {
                  return Container();
                }

                return ListView(children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _.dataList
                        .map((e) => GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.detailPokemon,
                                    parameters: {'id': _.getId(e.url)});
                              },
                              child: CardPokemon(
                                pokeList: e,
                                controller: _,
                              ),
                            ))
                        .toList(),
                  ),
                ]);
              }),
        )
      ],
    ));
  }
}
