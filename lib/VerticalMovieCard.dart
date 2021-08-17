import 'package:flutter/material.dart';
import 'package:mio_movie/MovieModel.dart';
import 'package:mio_movie/main.dart';

class VerticalMovieCard extends StatelessWidget {
  final Object appState;
  final MovieModel movie;
  VerticalMovieCard({required this.appState, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateToMovie(context, "/movie-details", movie),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    width: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(movie.image))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(100, 100, 0, 0),
                    child: CircleAvatar(
                        backgroundColor: Colors.blueGrey[50],
                        child: Icon(Icons.play_arrow_rounded,
                            color: Colors.cyan, size: 40)),
                  )
                ],
              ),
            ),

            SizedBox(width: 8),

            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(movie.name, style: TextStyle(color: Colors.cyan, fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Row(
                      children: movie.genre.map((genre) {
                        return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: Text(genre, style: TextStyle(color: Colors.pinkAccent, fontSize: 16))
                        );
                      }).toList()
                  ),
                  SizedBox(height: 4),
                  Text(movie.duration, style: TextStyle(color: Colors.pinkAccent, fontSize: 14, fontWeight: FontWeight.w300))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                        },
                        icon: Icon(Icons.delete, color: Colors.grey)
                    ),
                    IconButton(
                        onPressed: () {
                          navigateToMovie(context, "/movie-form", movie);
                        },
                        icon: Icon(Icons.edit, color: Colors.grey)
                    )
                  ]
              ),
            )
          ]
      ),
    );
  }
}
