import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:pokeapi/pages/home/domain/model/home_model.dart';
import 'package:pokeapi/pages/home/domain/model/pokemon_detail_model.dart';
import 'package:pokeapi/pages/home/presentation/controller/home_controller.dart';
import 'package:pokeapi/shared/widgets/text_default_widget.dart';
import 'package:pokeapi/shared/widgets/type_pokemon_widget.dart';

class CardPokemon extends StatelessWidget {
  const CardPokemon({
    Key? key,
    required this.pokeList,
    required this.controller,
  }) : super(key: key);
  final PokeList pokeList;
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: 180,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(),
                const Spacer(),
                LikeButton(
                  circleColor: const CircleColor(
                      start: Color(0xff00ddff), end: Color(0xff0099cc)),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.favorite,
                      color: isLiked ? Colors.red : Colors.grey,
                    );
                  },
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: controller.getDetail(pokeList.url),
              builder: (context, AsyncSnapshot<PokeDetail> snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    Center(
                      child: Image.network(
                        snap.data!.sprites.frontShiny,
                        width: 120,
                        scale: 0.01,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefault(
                            sizeText: 12,
                            colorText: Colors.black,
                            text: "000" + snap.data!.id.toString(),
                          ),
                          TextDefault(
                            sizeText: 16,
                            colorText: Colors.black,
                            text: pokeList.name,
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: snap.data!.types
                                  .take(2)
                                  .map(
                                    (e) => TypePokemon(
                                      nameType: e.type.name,
                                    ),
                                  )
                                  .toList())
                        ],
                      ),
                    )
                  ],
                );
              })
        ],
      ),
    );
  }
}
