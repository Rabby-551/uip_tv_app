class MovieModel {
  final String title;
  final String posterPath;
  final double? watchedTime;

  MovieModel({
    required this.title,
    required this.posterPath,
    this.watchedTime,
  });
}
