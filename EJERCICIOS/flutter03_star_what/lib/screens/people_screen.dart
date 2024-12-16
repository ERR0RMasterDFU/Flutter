import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter03_star_what/models/people_response/people.dart';
import 'package:flutter03_star_what/models/people_response/people_response.dart';
import 'package:flutter03_star_what/screens/people_detail_screen.dart';
import 'package:http/http.dart' as http;


class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        labelStyle: TextStyle(fontSize: 20, color: Color.fromARGB(255, 117, 117, 117)), // Color del texto
        filled: true,
        fillColor: Colors.white, // Color de fondo blanco
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide.none, // Elimina el borde predeterminado
        ),
        prefixIcon: Icon(Icons.search, color: Colors.black), // Icono de búsqueda
        contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0), // Reduce la altura
      ),
    );
  }
}


class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 24, 23, 23),
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(top: 70.0, bottom: 20.0),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [

            Container(
              padding: const EdgeInsets.only(left: 30.0, bottom: 5.0),
              child: const Text("Buscar",
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
              child: const SearchBar(),
            ),

            Container(
              padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
              child: const Text('PERSONAJES',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 24, 23, 23),
                  shadows: [
                    Shadow( // Sombra para simular el borde
                      offset: Offset(-1.5, -1.5),
                      color: Color.fromARGB(255, 249, 230, 15),
                    ),
                    Shadow(
                      offset: Offset(1.5, -1.5),
                      color: Color.fromARGB(255, 249, 230, 15),
                    ),
                    Shadow(
                      offset: Offset(1.5, 1.5),
                      color: Color.fromARGB(255, 249, 230, 15),
                    ),
                    Shadow(
                      offset: Offset(-1.5, 1.5),
                      color: Color.fromARGB(255, 249, 230, 15),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              // Expanded debe estar dentro de Column directamente
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: FutureBuilder<PeopleResponse>(
                  future: peopleResponse,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error}',
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return _buildPeopleList(context, snapshot.data!);
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ),

          ],

        ),
      ),
    );
  }


  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://www.swapi.tech/api/people'));

    if (response.statusCode == 200) {
      // Decodificar el cuerpo de la respuesta a Map<String, dynamic>
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Usar el Map decodificado para construir PeopleResponse
      return PeopleResponse.fromMap(responseData);
    } else {
      throw Exception('Failed to load people');
    }
  }

  Widget _buildPeopleList(BuildContext context, PeopleResponse peopleResponse) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: peopleResponse.results!.length,
      itemBuilder: (context, index) {
        return _buildPeopleItem(context, peopleResponse.results![index], index);
      });
  }

  Widget _buildPeopleItem(BuildContext context, People people, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PeopleDetailScreen(peopleItem: people, indexDetail: index),
          ),
        );
      },
      child: Column(
        children: [
      
        Container(
          margin: const EdgeInsets.only(right: 20.0),
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
              'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg',
              width: 210,
              height: 400,
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.only(right: 18.0),
          child: Text(people.name!.toUpperCase(), 
          textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),
          )
        )

        ],
      )
    );
  }

}
  
