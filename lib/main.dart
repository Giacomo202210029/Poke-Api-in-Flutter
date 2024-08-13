import 'package:flutter/material.dart';
import 'package:flutter_http_example/Model/Pokemon.dart';
import 'package:flutter_http_example/services/PokemonService.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  
  
}

class _MyAppState extends State<MyApp> {

  late Future<Pokemon> futurePokemon;
  
 @override
void initState() {
  super.initState();
  futurePokemon = fetchPokemon(7); // Pasa el ID del Pokémon
}

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Pokemon API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(appBar: AppBar(title: Text('Pokemon')),
      body: Center(child: FutureBuilder<Pokemon>(future: futurePokemon,builder:(context, snapshot) {
        if (snapshot.hasData) {
        final pokemon = snapshot.data!;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${pokemon.name}'),
            Text('Height: ${pokemon.height}'),
            Text('Weight: ${pokemon.weight}'),
            Image.network(pokemon.sprites?.frontDefault ?? ''),
          ],
        );
      } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return CircularProgressIndicator();
      },
      ),
      )
      )
    );
  }
}