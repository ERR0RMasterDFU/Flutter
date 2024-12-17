// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter04_navegation_bar/models/series/series_response.dart';
import 'package:http/http.dart' as http;


class SeriesScreen extends StatefulWidget {
  const SeriesScreen({super.key});

  @override
  State<SeriesScreen> createState() => _SeriesScreenState();
}


class _SeriesScreenState extends State<SeriesScreen> {

  static const API_KEY = "661fa9a8e740b44f7c49e088e2dcbea1";

  late Future<SeriesListResponse> seriesList;
  @override
  void initState() {
    super.initState();
    seriesList = getSeries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SERIES', 
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ),
        backgroundColor: Colors.blue
      ),
      body: FutureBuilder<SeriesListResponse>(
        future: seriesList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildSeriesList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Future<SeriesListResponse> getSeries() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/tv/popular?api_key=$API_KEY&language=ES'));
    if (response.statusCode == 200) {
      return SeriesListResponse.fromJson(json.decode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Fallo al cargar la página');
    }
  }

  Widget _buildSeriesList(SeriesListResponse seriesResponse) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 30, bottom: 35, right: 15, left: 15),

      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 30, 
        crossAxisSpacing: 15, 
        childAspectRatio: 0.7
      ),
      itemCount: seriesResponse.results!.length,
      itemBuilder: (context, index) {

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: AspectRatio(
                aspectRatio: 0.83,
                child: Image.network(
                  'https://image.tmdb.org/t/p/original/${seriesResponse.results![index].posterPath}', 
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 7,),
              padding: const EdgeInsets.only(top: 7, bottom: 7, right: 11, left: 11),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                seriesResponse.results![index].name!.toUpperCase(),
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

        );
      },
    );
  }

}