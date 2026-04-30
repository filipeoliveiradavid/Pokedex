import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon.dart';

class ApiService {
  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=30'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];

      return results.map((item) => Pokemon.fromJson(item)).toList();
    } else {
      throw Exception('Erro ao carregar Pokémons');
    }
  }
}
