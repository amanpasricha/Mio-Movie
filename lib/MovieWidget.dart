import 'package:flutter/material.dart';

class MovieWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final String id = routeArgs["id"]!.toString();
    final String movieName = routeArgs["name"]!.toString();
    final String genre = routeArgs["genre"]!.toString();
    final String movieGenre = genre.substring(1, genre.length-1);
    final String movieDuration = routeArgs["duration"]!.toString();
    final String movieImage = routeArgs["image"]!.toString();
    final String movieDescription = routeArgs["description"]!.toString();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 450,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32),
                          bottomRight: Radius.circular(32)
                      ),
                      image: DecorationImage(fit: BoxFit.cover, image: AssetImage(movieImage))
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(280, 400, 0, 0),
                    child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.blueGrey[50],
                        child: Icon(Icons.play_arrow_rounded, color: Colors.cyan, size: 80)
                    ),
                  )
                ]
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieName,
                      style: TextStyle(fontSize: 28, color: Colors.cyan, fontWeight: FontWeight.bold)
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          movieGenre,
                          style: TextStyle(fontSize: 24, color: Colors.pinkAccent, fontWeight: FontWeight.bold)
                        ),
                        Text(
                          movieDuration,
                          style: TextStyle(color: Colors.pinkAccent, fontSize: 20)
                        )
                      ]
                    ),
                    SizedBox(height: 16),
                    Text(movieDescription, style: TextStyle(fontSize: 18, color: Colors.grey[700]))
                  ]
                )
              )
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(Icons.edit),
          backgroundColor: Colors.pinkAccent,
          label: Text("Edit Movie", style: TextStyle(fontWeight: FontWeight.bold),)
      )
    );
  }
}
