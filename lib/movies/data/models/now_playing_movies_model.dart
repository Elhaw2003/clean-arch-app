import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';

class NowPlayingMoviesModel extends NowPlayingEntities {
  const NowPlayingMoviesModel({
    required super.backdropPath,
    required super.id,
    required super.genreIds,
    required super.overview,
    required super.title,
    required super.voteAverage,
  });

  factory NowPlayingMoviesModel.fromJson(Map<String, dynamic> json) {
    return NowPlayingMoviesModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      title: json["title"],
      voteAverage: json["vote_average"],
    );
  }
}
