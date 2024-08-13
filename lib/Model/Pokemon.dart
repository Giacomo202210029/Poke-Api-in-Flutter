
import 'package:flutter_http_example/ValueObjects/Ability.dart';
import 'package:flutter_http_example/ValueObjects/Sprites.dart';

class Pokemon {
  int? height;
  String? name;
  Ability? species;
  Sprites? sprites;
  int? weight;

  Pokemon({this.height, this.name, this.species, this.sprites, this.weight});

  Pokemon.fromJson(Map<String, dynamic> json) {
  height = json['height'] != null ? json['height'] as int : 0;
  name = json['name'] ?? '';
  species = json['species'] != null ? Ability.fromJson(json['species']) : null;
  sprites = json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
  weight = json['weight'] != null ? json['weight'] as int : 0;

  // Agrega estos prints para verificar los valores
  print("Name: $name");
  print("Height: $height");
  print("Weight: $weight");
  print("Sprites: ${sprites?.frontDefault}");
}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['name'] = this.name;
    if (this.species != null) {
      data['species'] = this.species!.toJson();
    }
    if (this.sprites != null) {
      data['sprites'] = this.sprites!.toJson();
    }
    data['weight'] = this.weight;
    return data;
  }
}
