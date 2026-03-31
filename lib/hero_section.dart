import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/elevation.webp',
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned.fill(
          //
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color.fromARGB(249, 0, 0, 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              // ElevatedButton(onPressed: () => {}, child: Icon(Icons.add)),
              Column(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.add),
                    color: Colors.white,
                  ),
                  Text('My List', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.black,
                    ),
                    child: Icon(Icons.play_arrow, size: 27),
                  ),
                  Text('Play', style: TextStyle(color: Colors.white)),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.info_outline),
                    color: Colors.white,
                  ),
                  Text('Info', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
        // Container(child: Column()),
      ],
    );
  }
}
