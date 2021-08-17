import 'package:flutter/material.dart';

class MovieModel {
  final String id;
  final String name;
  final List<String> genre;
  final String duration;
  final String image;
  final String description;

  MovieModel({
      required this.id,
      required this.name,
      required this.duration,
      required this.genre,
      required this.image,
      required this.description
  });

  bool equals(MovieModel movie) {
    if(this.id == movie.id)
      return true;
    return false;
  }

  MovieModel copy({
    String? id,
    String? name,
    String? duration,
    List<String>? genre,
    String? image,
    String? description
  }) =>
      MovieModel(
        id: id ?? this.id,
        name: name ?? this.name,
        duration: duration ?? this.duration,
        genre: genre ?? this.genre,
        image: image ?? this.image,
        description: description ?? this.description
      );


  Map<String, Object> toJson() => {
    MovieFields.id: id,
    MovieFields.name: name,
    MovieFields.duration: duration,
    MovieFields.genre: genre,
    MovieFields.image: image,
    MovieFields.description: description
  };
}

void navigateToMovie(BuildContext context, String route,MovieModel movie) {
  Navigator.of(context).pushNamed(
      route,
      arguments: {
        "id": movie.id,
        "name": movie.name,
        "genre": movie.genre,
        "duration": movie.duration,
        "image": movie.image,
        "description": movie.description
      }
  );
}

class MovieFields {
  static final String id = "_id";
  static final String name = "name";
  static final String duration = "duration";
  static final String genre = "genre";
  static final String image = "image";
  static final String description = "description";
}

