import 'dart:collection';

class Pokemon implements FirePokemon, WaterPokemon{
  final int? id;
  final String name;
  final String levelPower;

  Pokemon({this.id , required this.name,required this.levelPower});
  
  @override
  void evolucionar() {
    print("Evoluciona pokemon");
  }

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "levelpower": levelPower
    };
  }
}

class FirePokemon{
  void evolucionar(){
    print("Evoluciona FirePokemon");
  }
}

class WaterPokemon{
  void evolucionar(){
    print("Evoluciona WaterPokemon");
  }
}