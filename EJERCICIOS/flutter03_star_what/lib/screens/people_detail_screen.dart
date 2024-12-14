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
        padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),

        child: Column(
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
              margin: const EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0),
              child: SizedBox(
                height: 200,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Fecha de Nacimiento: ${widget.peopleItem.birthYear}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Altura: ${widget.peopleItem.height}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Peso: ${widget.peopleItem.mass}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Género: ${widget.peopleItem.gender}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Color de ojos: ${widget.peopleItem.eyeColor}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Color de pelo: ${widget.peopleItem.hairColor}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Text(
                          "Color de piel: ${widget.peopleItem.skinColor}",
                          style: const TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }
}