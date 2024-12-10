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

          /*ListView(
                  key: GlobalKey(),
                  scrollDirection: Axis.horizontal, // por defecto es vertical
                  Row(
                  children: [
                    // agregamos este espacio para que los widget empiecen abajo
                    // del área de configuraciones del dispositivo
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 80,
                      color: Colors.green[500],
                      child: const Center(child: Text('Widget A')),
                    ),
                    Container(
                      height: 70,
                      color: Colors.green[400],
                      child: const Center(child: Text('Widget B')),
                    ),
                    Container(
                      height: 60,
                      color: Colors.green[300],
                      child: const Center(child: Text('Widget C')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.green[200],
                      child: const Center(child: Text('Widget D')),
                    ),
                  ],    
                  ),      
          ),*/

            Column(
            
              children: [
            
                Container(
                  width: 230,
                  margin: const EdgeInsets.only(bottom: 20),
            
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    child: const Text('Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFE62F16),
                      ),
                    )
                  ),
                ),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                
                  children: [
                    const Text('Already have a Path account?',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.634),
                      )
                    ),
                
                    Container(
                      width: 230,
                      margin: const EdgeInsets.only(top: 5, bottom: 22),
                
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(230, 47, 22, 1),
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          side: const BorderSide(width: 1.0, color: Color.fromRGBO(255, 255, 255, 0.634))
                        ),
                        child: const Text('Log In',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromRGBO(255, 255, 255, 0.634),
                          ),
                        )
                      )
                    ),
                
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(text: "By using Path, you agree to Path's \n",
                        style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.634)),
                        children: [
                          TextSpan(text: "Terms of Use",
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                          TextSpan(text: " and ",
                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.634))),
                          TextSpan(text: "Privacy Policy",
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.underline)),
                          TextSpan(text: ".",
                            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.634)))
                        ]),
                    )
                
                  ],
                )
            
              ],
            )

          ],

        ),
      )
    );
  }
}
