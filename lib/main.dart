import 'package:flutter/material.dart';
import 'package:netflix_mock/hero_section.dart';
import 'package:netflix_mock/movie_list.dart';
import 'package:netflix_mock/option_row.dart';
import 'package:netflix_mock/show_list.dart';

void main() {
  runApp(NetflixCloneApp());
}

class NetflixCloneApp extends StatelessWidget {
  const NetflixCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    //this line means that we are overriding the build method of the StatelessWidget class,
    // which is responsible for building the UI of our app.
    //The build method takes a BuildContext as a parameter,
    // the build context is an object that is passed down the widget tree ,
    // contains information about the location of this widget in the widget tree.
    //which provides information about the location of this widget in the widget tree.
    // We use this context to access theme data, media queries, and other inherited widgets.
    //In this case, we will use it to build our MaterialApp widget.
    final trendingMovies = [
      'assets/images/b_avatar.webp',
      'assets/images/b_greenland.webp',
      'assets/images/b_drhouse.webp',
      'assets/images/interstellar.webp',
      'assets/images/elevation.webp',
      'assets/images/arrival.webp',
    ];

    final List<String> trendingShows = [
      'assets/images/b_peaky.webp',
      'assets/images/b_ncis.webp',
      'assets/images/b_mentalist.webp',
      'assets/images/demon.webp',
    ];
    return MaterialApp(
      title: 'Netflix Clone',
      home: Scaffold(
        //
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeroSection(),

              OptionRow(title: 'Movies trending today'),

              MovieList(imageUrls: trendingMovies),

              OptionRow(title: 'TV Shows trending today'),

              ShowList(imageUrls: trendingShows),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.download),
              label: 'Downloads',
            ),
          ],
        ),
      ),
    );
  }
}
