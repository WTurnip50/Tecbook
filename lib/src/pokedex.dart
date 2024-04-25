import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tecbook/src/models/pokemon.dart';

void main()=> runApp(MyPokedex());

class MyPokedex extends StatefulWidget{
  @override
   _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyPokedex>{
  late Future<List<Pokemon>> _datos;
  
  Future<List<Pokemon>> _getCharacters() async{
    String apiKey = "https://pokeapi.co/api/v2/pokedex/2/";
    final Uri url = Uri.parse(apiKey);
    final response = await http.get(url);

    List<Pokemon> pokemons = [];
    if(response.statusCode==200){
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      for(var item in jsonData["pokemon_entries"]){
        int num = item["entry_number"];
        pokemons.add(Pokemon(item["entry_number"],
         item["pokemon_species"]["name"],
         "Kanto",
         "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"+num.toString()+".png"));
        //pokemons.add(Pokemon(item["name"], item["status"], item["gender"],item["species"],item["image"]));
      }
      return pokemons;
    }else{
      print("Error al cargar los personajes: ${response.statusCode}");
       return [];
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _datos =  _getCharacters();
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Material app',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pokédex"),
          centerTitle: true,
        ),
        backgroundColor: Colors.lightBlue,
        body: FutureBuilder(
        future: _datos,
        builder: ((context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child:CircularProgressIndicator());
          }else if(snapshot.hasError){
            return const Center(child: Text("No se cargo la información"));
          }else{
            final data = snapshot.data!;
              return GridView.count(
                crossAxisCount: 2,
                children: _list(data),);
          }
          }
        )
       ),
      ),
    );
  }
  List<Widget> _list(List<Pokemon> data){
    List<Widget> characters= [];
    for(var char in data){
      characters.add(
        Card(
          color: Colors.blueGrey,
          child: Column(
          children: [
            Text("Id: " + char.number.toString()),
            Text('Name: '+char.name),
            Text("Region de origen: "+char.region),
            Image.network(char.url)
            ],
          ),
        )
      );
    }
    return characters;
  }
}



