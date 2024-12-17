// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter04_navegation_bar/models/movies/movies_response.dart';
import 'package:http/http.dart' as http;

/*class SearchBar extends StatelessWidget {
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
}*/

class MoviesScreen extends /*StatelessWidget*/ StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}


class _MoviesScreenState extends State<MoviesScreen> {

  static const API_KEY = "661fa9a8e740b44f7c49e088e2dcbea1";

  late Future<MoviesListResponse> moviesList;
  @override
  void initState() {
    super.initState();
    moviesList = getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        //title: const Text('People'),
      ),^*/
      body: FutureBuilder<MoviesListResponse>(
        future: moviesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildMoviesList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<MoviesListResponse> getMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&language=ES'));
    if (response.statusCode == 200) {
      return MoviesListResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildMoviesList(MoviesListResponse moviesResponse) {
    return ListView.builder(
        itemCount: moviesResponse.results!.length,
        itemBuilder: (context, index) {
          return Text(moviesResponse.results![index].title!);
          // https://image.tmdb.org/t/p/original/ + img
        });
  }
}