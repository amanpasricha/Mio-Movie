import 'package:flutter/material.dart';
import 'package:mio_movie/MovieModel.dart';
import 'package:mio_movie/MovieDetailsWidget.dart';
import 'package:mio_movie/HorizontalMovieCard.dart';
import 'package:mio_movie/VerticalMovieCard.dart';
import 'package:mio_movie/MovieForm.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<MovieModel> watchedMovieList = [
    MovieModel(id: "101", name: "The Philadelpha Experiment", genre: ["Suspense"], duration: "03h 15m", image: "images/image_1.png", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
    MovieModel(id: "102", name: "Interstellar (2014)", genre: ["Sci-Fi", "Adventure"], duration: "02h 30m", image: "images/image_2.png", description: ""),
    MovieModel(id: "103", name: "Arrival", genre: ["Adventure"], duration: "02h 30m", image: "images/image_3.png", description: ""),
  ];

  final List<MovieModel> trendingMovieList = [
    MovieModel(id: "101", name: "The Philadelpha Experiment", genre: ["Suspense"], duration: "03h 15m", image: "images/image_1.png", description: ""),
    MovieModel(id: "102", name: "Interstellar (2014)", genre: ["Sci-Fi", "Adventure"], duration: "02h 30m", image: "images/image_2.png", description: ""),
    MovieModel(id: "103", name: "Arrival", genre: ["Adventure"], duration: "02h 30m", image: "images/image_3.png", description: ""),
  ];

  void deleteFromList(MovieModel movie) {
    for(int x=0; x<trendingMovieList.length; x++) {
      if(movie.equals(trendingMovieList[x])) {
        trendingMovieList.removeAt(x);
        break;
      }
    }
  }

  TextStyle groupStyle() {
    return TextStyle(color: Colors.cyan, fontSize: 18, fontWeight: FontWeight.w700, letterSpacing: 1);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      routes: {
        "/movie-details": (context) => MovieDetailsWidget(),
        "/movie-form": (context) => MovieForm()
      },
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
                  Text(
                    "Hello, Aman Pasricha",
                    style: TextStyle(color: Colors.grey[700])
                  ),
                  Text(
                    "Let's explore your favourite movies",
                    style: TextStyle(color: Colors.pink, fontSize: 14, fontWeight: FontWeight.w300))
                ],
              )
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.search), color: Colors.grey)
          ]
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
                  children: watchedMovieList.map((movie) => HorizontalMovieCard(movie: movie)).toList()
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
                  Column(children: trendingMovieList.map((movie) => VerticalMovieCard(appState: this, movie: movie)).toList())
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
      )
    );
  }
}


