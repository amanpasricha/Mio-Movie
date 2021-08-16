class MovieCard {
  final String id;
  final String name;
  final List<String> genre;
  final String duration;
  final String image;
  final String description;

  MovieCard({
      required this.id,
      required this.name,
      required this.duration,
      required this.genre,
      required this.image,
      required this.description
  });
}