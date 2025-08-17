import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';

class PopularMoviesModel extends PopularEntities{
  const PopularMoviesModel({required super.backdropPath, required super.id, required super.genreIds, required super.overview, required super.title, required super.voteAverage, required super.releaseDate});
  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) {
    return PopularMoviesModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      title: json["title"],
      voteAverage: json["vote_average"].toDouble,
      releaseDate: json["release_date"],
    );
  }
}