import 'dart:convert';
import 'package:http/http.dart' as http; 

import 'package:flutter_http_example/Model/Pokemon.dart';

Future<Pokemon> fetchPokemon(int id) async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id'));
  if (response.statusCode == 200) {
    return Pokemon.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load pokemon');
  }
}
