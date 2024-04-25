import 'package:flutter/material.dart';
import 'package:tecbook/src/home.dart';
import 'package:tecbook/src/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => LoginScreen(),
        '/Home':(context)=> HomeScreen(Usuario:"",Data: [],),
      },
    );
  }
}