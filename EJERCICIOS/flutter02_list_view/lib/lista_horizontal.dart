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
                children: [

                  Text("Mejores protas de Jojo's\nBizarre Adventure",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w900
                    ),
                  ),

                  Text("Diciembre 2024",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 122, 122, 122),
                      //fontWeight: FontWeight.w900
                    )
                  ),

                ],
              )
            ),

            SizedBox(
              height: 670,
              child: ListView(
                key: GlobalKey(),
                scrollDirection: Axis.horizontal, // por defecto es vertical
                children: const [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Jojo.jpg'), width: 200
                      ),

                      Text("Diciembre 2024",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 122, 122, 122),
                          //fontWeight: FontWeight.w900
                        )
                      ),
                    ]
                  ),
              
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Joseph.jpg'), width: 200
                      ),

                      Text("Diciembre 2024",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 122, 122, 122),
                          //fontWeight: FontWeight.w900
                        )
                      ),
                    ]
                  ),

                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/Jojo.jpg'), width: 200
                      ),

                      Text("Diciembre 2024",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 122, 122, 122),
                          //fontWeight: FontWeight.w900
                        )
                      ),

                    ]
                  )
                  
                ]
              )
            )
          ],
        )
      )
    );
  }
}
