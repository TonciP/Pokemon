
import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/provider/pokemon_provider.dart';
import 'package:provider/provider.dart';

class ListPokemonScreen extends StatelessWidget {
  const ListPokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonViewModel = Provider.of<PokemonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Pokemon"),
      ),
      body: ListView.builder(
        itemCount: pokemonViewModel.pokemons.length,
        itemBuilder: (context, position) {
          final pokemon = pokemonViewModel.pokemons[position];
          return ListTile(
            title: Text(pokemon.name),
            subtitle: Text(pokemon.levelPower),
            leading: Icon(Icons.account_box),
            onTap:
                () => showDialog(
                  context: context,
                  builder:
                      (context) => Dialog(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed:
                                  () => {
                                    pokemonViewModel.eliminarPokemon(
                                      pokemon.id ?? 0,
                                    ),
                                    Navigator.pop(context)
                                  },
                              child: Text("Eliminar"),
                            ),
                            ElevatedButton(
                              onPressed: () => {Navigator.pop(context)},
                              child: Text("Cancelar"),
                            ),
                          ],
                        ),
                      ),
                ),
          );
        },
      ),
    );
  }
}
