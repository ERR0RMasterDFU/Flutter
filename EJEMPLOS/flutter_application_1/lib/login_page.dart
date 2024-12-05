import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  /*El Método build es el encargado de dibujar la interfaz de usuario
  de la página.
  Por eso devuelve un Widget, que es el elemento que va a ser dibujado.*/
  @override
  Widget build(BuildContext context) {
    return const Text('Hola, este es el login.');
  }
}