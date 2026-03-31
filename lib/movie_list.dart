import 'package:flutter/material.dart';

class MovieList extends StatelessWidget {
  final List<String> imageUrls;

  const MovieList({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      // 3. Use ListView.builder for dynamic, efficient rendering
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length, // Tell Flutter how many items there are
        itemBuilder: (context, index) {
          // Pass the specific image path for this index to your helper function
          return listItem(imageUrls[index], 100, 150);
        },
      ),
    );
  }
}

Padding listItem(String imagePath, double width, double height) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.asset(imagePath, fit: BoxFit.cover),
      ),
    ),
  );
}
