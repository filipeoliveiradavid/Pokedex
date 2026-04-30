import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'api_service.dart';
import 'firebase_service.dart';
import 'pokemon.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService api = ApiService();
  final FirebaseService firebaseService = FirebaseService();

  Set<String> favoritos = {};
  bool carregandoFavorito = false;

  List<Pokemon> todosPokemons = [];
  List<Pokemon> pokemonsFiltrados = [];

  String getImageByUrl(String url) {
    final id = url.split('/')[url.split('/').length - 2];
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  void filtrarPokemons(String texto) {
    setState(() {
      pokemonsFiltrados = todosPokemons
          .where(
            (pokemon) =>
                pokemon.name.toLowerCase().contains(texto.toLowerCase()),
          )
          .toList();
    });
  }

  Future<void> favoritar(String nome, String imagem) async {
    if (carregandoFavorito) return;

    setState(() {
      carregandoFavorito = true;
    });

    try {
      if (favoritos.contains(nome)) {
        await firebaseService.removerFavorito(nome);

        setState(() {
          favoritos.remove(nome);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$nome removido dos favoritos'),
            backgroundColor: Colors.orange,
          ),
        );
      } else {
        await firebaseService.favoritarPokemon(nome, imagem);

        setState(() {
          favoritos.add(nome);
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$nome adicionado aos favoritos ⭐'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao salvar no Firebase'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        carregandoFavorito = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      appBar: AppBar(
        title: const Text('Pokédex'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextField(
              onChanged: filtrarPokemons,
              decoration: InputDecoration(
                hintText: 'Pesquisar Pokémon...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Pokemon>>(
              future: api.fetchPokemons(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Erro ao carregar os Pokémons'),
                  );
                }

                if (todosPokemons.isEmpty) {
                  todosPokemons = snapshot.data!;
                  pokemonsFiltrados = todosPokemons;
                }

                if (pokemonsFiltrados.isEmpty) {
                  return const Center(
                    child: Text('Nenhum Pokémon encontrado'),
                  );
                }

                return ListView.builder(
                  itemCount: pokemonsFiltrados.length,
                  itemBuilder: (context, index) {
                    final pokemon = pokemonsFiltrados[index];
                    final imagem = getImageByUrl(pokemon.url);
                    final isFavorito = favoritos.contains(pokemon.name);

                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: Image.network(imagem),
                        title: Text(
                          pokemon.name.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: const Text('Dados da PokéAPI'),
                        trailing: IconButton(
                          icon: carregandoFavorito
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  isFavorito ? Icons.star : Icons.star_border,
                                  color:
                                      isFavorito ? Colors.amber : Colors.grey,
                                ),
                          onPressed: () {
                            favoritar(pokemon.name, imagem);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
