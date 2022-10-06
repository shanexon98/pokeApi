import 'dart:convert';

PokeDetail pokeDetailFromJson(String str) =>
    PokeDetail.fromJson(json.decode(str));

String pokeDetailToJson(PokeDetail data) => json.encode(data.toJson());

class PokeDetail {
  PokeDetail({
    required this.id,
    required this.height,
    required this.weight,
    required this.name,
    required this.sprites,
    required this.types,
  });

  int id;
  String name;
  Sprites sprites;
  List<TypeElement> types;
  int height;
  int weight;

  factory PokeDetail.fromJson(Map<String, dynamic> json) => PokeDetail(
        id: json["id"],
        height: json['height'],
        weight: json['weight'],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        types: List<TypeElement>.from(
            json["types"].map((x) => TypeElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sprites": sprites.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class Sprites {
  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class TypeElement {
  TypeElement({
    required this.slot,
    required this.type,
  });

  int slot;
  TypeType type;

  factory TypeElement.fromJson(Map<String, dynamic> json) => TypeElement(
        slot: json["slot"],
        type: TypeType.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class TypeType {
  TypeType({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory TypeType.fromJson(Map<String, dynamic> json) => TypeType(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
