import 'package:flutter/material.dart';
import 'package:tecbook/src/home.dart';
import 'package:tecbook/src/models/publications.dart';
import 'package:tecbook/src/screens/textfields.dart';

void Post()=>runApp(PostScreen(Usuario: "",Data: [],));

class PostScreen extends StatefulWidget{
  final String Usuario;
  List<Publications> Data;
  PostScreen({required this.Usuario,required this.Data});
  _PostState createState() => _PostState();
}
class _PostState extends State<PostScreen>{
  TextEditingController _descController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  @override
  void initState(){
    super.initState();
  }
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Post",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Post"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Text("Nombre: "+widget.Usuario,),
              MyTextField(label: "Descripción ", visible: false, textController: _descController),
              MyTextField(label: "Lugar", visible: false, textController: _locationController),
              MyTextField(label: "Url", visible: false, textController: _imageController)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          isExtended: true,
          elevation: 20.0,
          onPressed: () {
            String description = _descController.text;
            String Location = _locationController.text;
            String Image = _imageController.text;
            widget.Data.add(Publications(widget.Usuario, description, Location, Image));
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen(
                          Usuario: widget.Usuario,
                          Data: widget.Data,
                    )
                )
            );
          },
          child: Icon(Icons.save,color: Colors.white,),
          backgroundColor: Colors.blueAccent
        ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
      ),
    );
  }
}