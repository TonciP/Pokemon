import 'dart:async';

import 'package:path/path.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:sqflite/sqflite.dart';

class Conn {
  static Future<Database> openConnection() async {
    return openDatabase(
      join(await getDatabasesPath(), 'pokemon_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE pokemon(id INTEGER PRIMARY KEY, name TEXT, levelpower INTEGER)',
        );
      },
      version: 1,
    );
  }

  static Future<int> insertPokemon(Pokemon pokemon) async {
    final db = await openConnection();
    return db.insert("pokemon", pokemon.toMap());
  }

  static Future<int> deletePokemon(int id) async{
    final db = await openConnection();
    return db.delete("pokemon", where: "id=${id.toString()}");
  }


  static Future<List<Pokemon>> getAllPokemon() async {
    final db = await openConnection();
    final List<Map<String, dynamic>> pokemondb = await db.query('pokemon');
    return List.generate(
      pokemondb.length,
      (position) => Pokemon(
        id: pokemondb[position]['id'],
        name: pokemondb[position]['name'],
        levelPower: pokemondb[position]['levelpower'],
      ),
    );
  }
}
