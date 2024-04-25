import 'package:flutter/material.dart';
import 'package:tecbook/src/home.dart';
import 'package:tecbook/src/models/Users.dart';
import 'package:tecbook/src/screens/textfields.dart';

void Login() => runApp(LoginScreen());

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  String welcome = "Bienvenido a tecbook";
  TextEditingController _usuarioController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

  void onPressed() {
    String user = _usuarioController.text.trim();
    String pass = _contrasenaController.text.trim();
    var users = [
      Users("Israel", "1234"),
      Users("Angel", "ang31"),
      Users("Gabriel", "gabo05")
    ];
    for (var us in users) {
      if (user == us.username && pass == us.password) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      Usuario: user,
                      Data: [],
                )
            )
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tecbook',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Tecbook"),
          centerTitle: true,
        ),
        backgroundColor: const Color.fromARGB(255, 238, 235, 235),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(welcome,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)
                  ),
              const Text("Iniciar Sesión"),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                label: "usuario",
                visible: false,
                textController: _usuarioController,
              ),
              const SizedBox(
                height: 20,
              ),
              MyTextField(
                label: "contraseña",
                visible: true,
                textController: _contrasenaController,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(
                    "Ingresar",
                    style: TextStyle(color: Colors.black),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
