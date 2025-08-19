import 'package:clean_arch_app/movies/domain/entities/recommendation_movie_entities.dart';

class RecommendationMovieModel extends RecommendationMovieEntities{
  const RecommendationMovieModel({required super.id, required super.backdropPath});
  factory RecommendationMovieModel.fromJson(Map<String,dynamic> json){
    return RecommendationMovieModel(id: json["id"], backdropPath: json["backdrop_path"]);
  }
}