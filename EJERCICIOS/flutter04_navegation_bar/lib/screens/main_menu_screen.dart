import 'package:flutter/material.dart';
import 'package:flutter04_navegation_bar/screens/home_screen.dart';
import 'package:flutter04_navegation_bar/screens/movies_screen.dart';
import 'package:flutter04_navegation_bar/screens/series_screen.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        backgroundColor: Colors.blue,
        indicatorColor: Colors.white,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.movie_edit),
            label: 'Películas',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home_outlined),
            icon: Icon(Icons.home_outlined),
            label: 'Principal',
          ),
          NavigationDestination(
            icon: Icon(Icons.tv),
            label: 'Series',
          ),
        ],
      ),
      body: [const MoviesScreen(), const HomeScreen(), const SeriesScreen()][currentPageIndex]
    );
  }

}