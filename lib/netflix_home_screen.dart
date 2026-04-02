
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:netflix_mock/movie_list.dart';
import 'package:netflix_mock/option_row.dart';
import 'package:netflix_mock/show_list.dart'; // Required to parse JSON data

class NetflixHomeScreen extends StatefulWidget {
  const NetflixHomeScreen({super.key});

  @override
  State<NetflixHomeScreen> createState() => _NetflixHomeScreenState();
}

class _NetflixHomeScreenState extends State<NetflixHomeScreen> {
  // 1. Initialize empty lists to hold our future API data
  List<String> trendingMovies = [];
  List<String> trendingShows = [];
  
  // A boolean to show a loading spinner while data fetches
  bool isLoading = true; 

  // Add your TMDB API key here
  final String apiKey = 'YOUR_TMDB_API_KEY'; 

  @override
  void initState() {
    super.initState();
    // 2. Call our fetch functions the moment the screen loads
    fetchData();
  }

  // 3. The function that reaches out to the internet
  Future<void> fetchData() async {
    try {
      // Fetch Movies
      final movieResponse = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey'));
      
      // Fetch TV Shows
      final tvResponse = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/trending/tv/day?api_key=$apiKey'));

      if (movieResponse.statusCode == 200 && tvResponse.statusCode == 200) {
        // Parse the JSON string into a Dart Map
        final movieData = jsonDecode(movieResponse.body);
        final tvData = jsonDecode(tvResponse.body);

        // Extract the poster paths and build the full image URLs
        setState(() {
          // TMDB only gives us the end of the image path (e.g., "/kqjL17yufvn9OVLyXYpvtyrFfak.jpg")
          // We have to add the base URL to make it a complete web link.
          String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

          // Map the results into our List<String>
          trendingMovies = (movieData['results'] as List).map((movie) {
            return imageBaseUrl + movie['poster_path'];
          }).toList();

          trendingShows = (tvData['results'] as List).map((show) {
            return imageBaseUrl + show['poster_path'];
          }).toList();

          // Turn off the loading spinner
          isLoading = false; 
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      // Handle errors here (e.g., show an error message to the user)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        // 4. Show a loading spinner if we are still fetching data
        child: isLoading 
            ? const Center(child: CircularProgressIndicator(color: Colors.red))
            : SingleChildScrollView(
                child: Column(
                  children: [

                    OptionRow(title: 'Trending Movies'),
                    MovieList(imageUrls: trendingMovies),

                    OptionRow(title: 'Trending TV Shows'),
                    ShowList(imageUrls: trendingShows),
                  ],
                ),
              ),
      ),
    );
  }
}

