// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class ListaHorizontal extends StatelessWidget {
  const ListaHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        width: double.infinity,

        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
 
            Container(
              padding: const EdgeInsets.only(top: 75.0, left: 40.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Mejores protas de Jojo's\nBizarre Adventure",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w900
                    ),
                  ),

                  SizedBox(height: 10),

                  Text("¡De la primera parte a la quinta!",
                  textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 122, 122, 122),
                      fontWeight: FontWeight.w300
                    )
                  ),

                ],
              )
            ),

            SizedBox(
              
              height: 700,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  Container(
                    padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                    height: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Asegura que el contenido no desborde
                      children: [
                        Image.asset('assets/jonathan.jpg', 
                          width: 150, height: 550, 
                          scale: 1, // Reduce el factor de escala interno para hacerla más grande
                          fit: BoxFit.cover,
                          
                        ),
                        const SizedBox(height: 10), // Espaciado entre imagen y texto
                        const Text(
                          "Jonathan\nJoestar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                    height: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Asegura que el contenido no desborde
                      children: [
                        Image.asset('assets/joseph.jpg', 
                          width: 150, height: 550, 
                          scale: 1, // Reduce el factor de escala interno para hacerla más grande
                          fit: BoxFit.cover,
                          
                        ),
                        const SizedBox(height: 10), // Espaciado entre imagen y texto
                        const Text(
                          "Joseph\nJoestar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                    height: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Asegura que el contenido no desborde
                      children: [
                        Image.asset('assets/jotaro.jpg', 
                          width: 150, height: 550, 
                          scale: 1, // Reduce el factor de escala interno para hacerla más grande
                          fit: BoxFit.cover,
                          
                        ),
                        const SizedBox(height: 10), // Espaciado entre imagen y texto
                        const Text(
                          "Jotaro\nKujo",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 40.0, left: 20.0),
                    height: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Asegura que el contenido no desborde
                      children: [
                        Image.asset('assets/josuke.jpg', 
                          width: 150, height: 550, 
                          scale: 1, // Reduce el factor de escala interno para hacerla más grande
                          fit: BoxFit.cover,
                          
                        ),
                        const SizedBox(height: 10), // Espaciado entre imagen y texto
                        const Text(
                          "Josuke\nHagashikata",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.only(top: 40.0, left: 20.0, right: 40.0),
                    height: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Asegura que el contenido no desborde
                      children: [
                        Image.asset('assets/giorno.jpg', 
                          width: 150, height: 550, 
                          scale: 1, // Reduce el factor de escala interno para hacerla más grande
                          fit: BoxFit.cover,
                          
                        ),
                        const SizedBox(height: 10), // Espaciado entre imagen y texto
                        const Text(
                          "Giorno\nGiovanna",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900
                          ),
                        ),
                      ],
                    ),
                  )
                  
                ],
              ),
            ),

          ],
        )
      )
    );
  }
}
