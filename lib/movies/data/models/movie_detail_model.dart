import 'package:clean_arch_app/movies/domain/entities/movie_details_entities.dart';

class MovieDetailModel extends MovieDetailsEntities {
  const MovieDetailModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage,
    required super.runtime,
    required super.genres,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      runtime: json["runtime"],
      genres:  List<GenresModel>.from((json["genres"] as List).map((e) => GenresModel.fromJson(e))),
    );
  }
}
class GenresModel extends GenresEntities{
  const GenresModel({required super.id,required super.name});
  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json["id"],
      name: json["name"],
    );
  }
}
