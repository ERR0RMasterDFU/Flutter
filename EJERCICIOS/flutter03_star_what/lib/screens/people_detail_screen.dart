import 'package:flutter/material.dart';
import 'package:flutter03_star_what/models/people_response/people.dart';

class PeopleDetailScreen extends StatefulWidget {
  final People peopleItem;
  final int indexDetail;
  const PeopleDetailScreen({super.key, required this.peopleItem, required this.indexDetail});

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 249, 230, 15) 
        ),
        title: Text(widget.peopleItem.name!.toUpperCase(),
          style: const TextStyle(
            color: Color.fromARGB(255, 249, 230, 15),
            fontSize: 28,
            fontWeight: FontWeight.w700,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 24, 23, 23)
      ),
      body: Container(
        color: const Color.fromARGB(255, 24, 23, 23),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),

        child: ListView(
          
          children: [

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                Container(
                  margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 4.0,
                      color: const Color.fromARGB(255, 249, 230, 15),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      'https://starwars-visualguide.com/assets/img/characters/${widget.indexDetail + 1}.jpg',
                      width: 310,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  margin: const EdgeInsets.only(top: 25.0, right: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Fecha de Nacimiento: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: widget.peopleItem.birthYear,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),

                      const SizedBox(height: 8),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Altura: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: "${widget.peopleItem.height} cm",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),

                      const SizedBox(height: 8),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Peso: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: "${widget.peopleItem.mass} Kg" ,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),             

                      const SizedBox(height: 8),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Género: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: widget.peopleItem.gender,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),

                      const SizedBox(height: 8),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Color de ojos: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: widget.peopleItem.eyeColor,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),

                      const SizedBox(height: 8),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Color de pelo: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: widget.peopleItem.hairColor,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),

                      const SizedBox(height: 8),

                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(text: "Color de piel: ",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          children:[
                            TextSpan(text: widget.peopleItem.skinColor,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.normal
                              )
                            ),
                          ] 
                        )
                      ),

                    ]
                  )
                )
              ]
                
            )
          ]
        ),
      )
    );
  }
}