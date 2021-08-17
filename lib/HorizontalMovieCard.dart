import 'package:flutter/material.dart';
import 'package:mio_movie/MovieModel.dart';

class HorizontalMovieCard extends StatelessWidget {
  final MovieModel movie;
  HorizontalMovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        child: GestureDetector(
            onTap: () => navigateToMovie(context, "/movie-details", movie),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 160,
                  margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(movie.image))),
                ),
                Container(
                    height: 60,
                    width: 160,
                    margin: const EdgeInsets.fromLTRB(20, 140, 0, 0),
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    alignment: Alignment.center,
                    child: Text(movie.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.pinkAccent[100])),
                Padding(
                  padding: const EdgeInsets.fromLTRB(100, 180, 0, 0),
                  child: CircleAvatar(
                      backgroundColor: Colors.blueGrey[50],
                      child: Icon(Icons.play_arrow_rounded, color: Colors.cyan, size: 40)),
                )
              ],
            )
        )
    );
  }
}