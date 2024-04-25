import 'package:flutter/material.dart';
import 'package:tecbook/src/Post.dart';
import 'package:tecbook/src/models/publications.dart';
import 'package:tecbook/src/pokedex.dart';

void Home() => runApp(HomeScreen(
      Usuario: '',
      Data: [],
    ));

class HomeScreen extends StatefulWidget {
  final String Usuario;
  List<Publications> Data;
  HomeScreen({required this.Usuario, required this.Data});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  late List Data = [];
  //late List<Widget> cards = [];
  @override
  void initState() {
    super.initState();
    //cards = _pubs(widget.Data);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Inicio"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: widget.Data.length,
            itemBuilder: (context, index) {
              final pub = widget.Data[index];
              return Card(
                child: Column(
                  children: [
                    Image.network(
                      pub.url,
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                      width: 120,
                      height: 120,
                    ),
                    Text(pub.username),
                    Text(pub.description),
                    Text(pub.location),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.Data.removeAt(index);
                        });
                      },
                      style: ButtonStyle(alignment: AlignmentDirectional.centerEnd),
                      child: Text(
                        "Eliminar",
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    )
                  ],
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PostScreen(
                          Usuario: widget.Usuario,
                          Data: widget.Data,
                        )));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.greenAccent,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>MyPokedex()));
                },
                child: Text("Abrir pokédex"))
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _pubs(List<Publications> data) {
    List<Widget> items = [];
    for (var pub in data) {
      items.add(Card(
        child: Column(
          children: [
            Expanded(child: Image.network(pub.url, fit: BoxFit.fitHeight)),
            Text(pub.username),
            Text(pub.description),
            Text(pub.location)
          ],
        ),
      ));
    }
    return items;
  }
}
