// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter04_navegation_bar/models/movies/movies_response.dart';
import 'package:flutter04_navegation_bar/models/people/people_response.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>  {

  static const API_KEY = "661fa9a8e740b44f7c49e088e2dcbea1";

  late Future<MoviesListResponse> moviesList;
  late Future<PeopleListResponse> peopleList; 

  @override
  void initState() {
    super.initState();
    moviesList = getMovies();
    peopleList = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PRINCIPAL', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.blue
      ),
      body: ListView( 
        children: [

          /*const Text("PELÍCULAS",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w900,
            )
          ),*/

          FutureBuilder<MoviesListResponse>(
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

          FutureBuilder<PeopleListResponse>(
            future: peopleList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildPeopleList(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            },
          )

        ]
      )

    );
  }

  Future<MoviesListResponse> getMovies() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$API_KEY&language=ES'));
    if (response.statusCode == 200) {
      return MoviesListResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Fallo al cargar las películas');
    }
  }

  Future<PeopleListResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=$API_KEY&language=ES'));
    if (response.statusCode == 200) {
      return PeopleListResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Fallo al cargar los actores');
    }
  }


  Widget _buildMoviesList(MoviesListResponse moviesResponse) {
    return SizedBox(
      height: 200, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moviesResponse.results!.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${moviesResponse.results![index].posterPath}',
                    fit: BoxFit.cover
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    moviesResponse.results![index].title!.toUpperCase(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPeopleList(PeopleListResponse peopleResponse) {
    return SizedBox(
      height: 200, 
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peopleResponse.results!.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${peopleResponse.results![index].profilePath}',
                    fit: BoxFit.cover
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    peopleResponse.results![index].name!.toUpperCase(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}