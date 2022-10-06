import 'dart:convert';

Pokemon PokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String PokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  Pokemon({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<PokeList> results;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<PokeList>.from(
            json["results"].map((x) => PokeList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class PokeList {
  PokeList({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokeList.fromJson(Map<String, dynamic> json) => PokeList(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
