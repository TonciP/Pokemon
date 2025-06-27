import 'package:flutter/material.dart';
import 'package:pokemon/config/Conn.dart';
import 'package:pokemon/models/pokemon.dart';

class PokemonProvider with ChangeNotifier {
  late List<Pokemon> pokemons = [];

  PokemonProvider(){
    listarPokemon();
  }

  void registrarPokemon(Pokemon persona) async {
    await Conn.insertPokemon(persona);
    listarPokemon();
    notifyListeners();
  }

  void eliminarPokemon(int id) async{
    await Conn.deletePokemon(id);
    listarPokemon();
    notifyListeners();
  }

  void listarPokemon() async {
    pokemons = await Conn.getAllPokemon();
    notifyListeners();
  }
}
