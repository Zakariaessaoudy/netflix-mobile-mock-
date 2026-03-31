import 'package:flutter/material.dart';
import 'package:netflix_mock/movie_list.dart';

class ShowList extends StatelessWidget {
  // Works exactly the same way as MovieList!
  final List<String> imageUrls;

  const ShowList({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return listItem(imageUrls[index], 100, 150);
        },
      ),
    );
  }
}
