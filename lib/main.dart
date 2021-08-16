import 'package:flutter/material.dart';
import 'MovieCard.dart';

void main() {
  runApp(MyApp());
}


TextStyle groupStyle() {
  return TextStyle(color: Colors.cyan, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 1);
}


class MyApp extends StatelessWidget {
  final List<MovieCard> watchedMovieList = [
    MovieCard(name: "The Philadelpha Experiment", genre: ["Suspense"], duration: "03h 15m", image: "images/image_1.png"),
    MovieCard(name: "Interstellar (2014)", genre: ["Sci-Fi", "Adventure"], duration: "02h 30m", image: "images/image_2.png"),
    MovieCard(name: "Arrival", genre: ["Adventure"], duration: "02h 30m", image: "images/image_3.png"),
  ];

  final List<MovieCard> trendingMovieList = [
    MovieCard(name: "The Philadelpha Experiment", genre: ["Suspense"], duration: "03h 15m", image: "images/image_1.png"),
    MovieCard(name: "Interstellar (2014)", genre: ["Sci-Fi", "Adventure"], duration: "02h 30m", image: "images/image_2.png"),
    MovieCard(name: "Arrival", genre: ["Adventure"], duration: "02h 30m", image: "images/image_3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
                radius: 20.0,
                child: Text("AP", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
                backgroundColor: Colors.pinkAccent),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello, Aman Pasricha",
                    style: TextStyle(color: Colors.grey[700])),
                Text("Let's explore your favourite movies",
                    style: TextStyle(
                        color: Colors.pink,
                        fontSize: 14,
                        fontWeight: FontWeight.w300))
              ],
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.search), color: Colors.grey)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 8, 8),
                child: Text("Continue Watching", style: groupStyle())),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: watchedMovieList.map((movie) => MovieCardHorizontal(movie: movie)).toList()
              ),
            ),

            SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Trending Movies", style: groupStyle()),
                SizedBox(height: 8),
                Column(children: trendingMovieList.map((movie) => MovieCardVertical(movie: movie)).toList())
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_queue_rounded),
            label: 'New Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.pinkAccent,
        onTap: (int) {},
      )
    ));
  }
}

class MovieCardHorizontal extends StatelessWidget {
  final MovieCard movie;
  MovieCardHorizontal({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Stack(
        children: <Widget>[
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
                child: Icon(Icons.play_arrow_rounded,
                    color: Colors.cyan, size: 40)),
          )
        ],
      ),
    );
  }
}

class MovieCardVertical extends StatelessWidget {
  final MovieCard movie;
  MovieCardVertical({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          child: Stack(
            children: <Widget>[
              Container(
                height: 120,
                width: 160,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(movie.image))),
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
              Text(movie.name, style: groupStyle()),
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
              IconButton(onPressed: () {}, icon: Icon(Icons.delete, color: Colors.grey)),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit, color: Colors.grey)),
            ]
          ),
        )
      ]
    );
  }
}
