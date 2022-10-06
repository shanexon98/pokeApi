import 'package:flutter/material.dart';
import 'package:pokeapi/shared/widgets/text_default_widget.dart';

class TypePokemon extends StatelessWidget {
  const TypePokemon({Key? key, required this.nameType}) : super(key: key);
  final String nameType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color(0xffE5E7EB)),
      child: Center(
          child: TextDefault(
        sizeText: 14,
        colorText: Colors.black,
        text: nameType,
        fontWeight: FontWeight.w400,
      )),
    );
  }
}
