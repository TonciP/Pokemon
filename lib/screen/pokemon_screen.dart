import 'package:flutter/material.dart';
import 'package:pokemon/models/pokemon.dart';
import 'package:pokemon/provider/pokemon_provider.dart';
import 'package:pokemon/screen/listpokemon.dart';
import 'package:provider/provider.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemonProvider = Provider.of<PokemonProvider>(context);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _powerLeveController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Registro de Pokémon")),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _powerLeveController,
                decoration: const InputDecoration(hintText: 'Nivel de poder'),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if ( _formKey.currentState!.validate()) {
                      print(_nameController.text);
                      print(_powerLeveController.text);

                      // Retraso antes de realizar el registro
                      Future.delayed(Duration(milliseconds: 200), () {
                        pokemonProvider.registrarPokemon(
                          Pokemon(
                            name: _nameController.text,
                            levelPower: _powerLeveController.text,
                          ),
                        );
                      });
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListPokemonScreen(),
                      ),
                    );
                  },
                  child: const Text('Lista de Pokemon'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
