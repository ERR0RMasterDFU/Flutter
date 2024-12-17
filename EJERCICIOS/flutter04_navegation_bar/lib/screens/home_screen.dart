import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      /*body: FutureBuilder<SeriesListResponse>(
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
      ),*/
    );
  }

}