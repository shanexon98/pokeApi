import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/pages/detailPokemon/presentation/controller/detail_pokemon_controller.dart';
import 'package:pokeapi/shared/widgets/layout_widget.dart';
import 'package:pokeapi/shared/widgets/type_pokemon_widget.dart';

import '../../../../shared/widgets/text_default_widget.dart';

class DetailPokemonView extends StatelessWidget {
  const DetailPokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPokemonController>(
        id: 'detail',
        builder: (_) {
          return Layout(
              body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(
                          Icons.keyboard_backspace,
                          size: 30,
                        ),
                      ),
                      Center(
                        child: Image.network(
                          _.pokeDetail.sprites.frontShiny,
                          width: 200,
                          height: 200,
                          scale: 0.01,
                        ),
                      ),
                      const CardDetailPokemon()
                    ],
                  ),
          ));
        });
  }
}

class CardDetailPokemon extends StatelessWidget {
  const CardDetailPokemon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailPokemonController>(builder: (_) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  TextDefault(
                    sizeText: 32,
                    colorText: Colors.black,
                    text: _.pokeDetail.name,
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: _.pokeDetail.types
                          .take(2)
                          .map(
                            (e) => TypePokemon(nameType: e.type.name),
                          )
                          .toList()),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextDefault(
                        overflow: TextOverflow.fade,
                        fontWeight: FontWeight.w400,
                        sizeText: 16,
                        colorText: Colors.black,
                        text: ''),
                  ),
                  TextInfo(atribute: 'ID:', value: _.pokeDetail.id.toString()),
                  TextInfo(
                      atribute: 'Altura:',
                      value: _.pokeDetail.height.toString()),
                  TextInfo(
                      atribute: 'Peso:', value: _.pokeDetail.weight.toString()),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(200, 47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // <-- Radius
                        ),
                        primary: const Color(0xffEF4444)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: TextDefault(
                        sizeText: 16,
                        colorText: Colors.white,
                        text: 'AGREGAR A FAVORITOS   ',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class TextInfo extends StatelessWidget {
  const TextInfo({
    Key? key,
    required this.atribute,
    required this.value,
  }) : super(key: key);
  final String atribute;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextDefault(
              fontWeight: FontWeight.w700,
              sizeText: 16,
              colorText: Colors.black,
              text: atribute),
          const SizedBox(
            width: 10,
          ),
          TextDefault(
              fontWeight: FontWeight.w400,
              sizeText: 16,
              colorText: Colors.black,
              text: value),
        ],
      ),
    );
  }
}
