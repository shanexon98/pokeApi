import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokeapi/shared/widgets/layout_widget.dart';
import 'package:pokeapi/shared/widgets/text_default_widget.dart';

class FavoritePokemonView extends StatelessWidget {
  const FavoritePokemonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              const SizedBox(width: 15),
              const TextDefault(
                sizeText: 32,
                colorText: Colors.black,
                text: 'Favoritos',
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
