import 'package:clean_arch_app/core/base_usecase/base_usecase.dart';
import 'package:clean_arch_app/core/error/failure.dart';
import 'package:clean_arch_app/movies/domain/entities/recommendation_movie_entities.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetRecommendationMoviesUseCase extends BaseUseCase<List<RecommendationMovieEntities>,RecommendationMovieParam>{
  final BaseMoviesRepository baseMoviesRepository;
  GetRecommendationMoviesUseCase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, List<RecommendationMovieEntities>>> call(RecommendationMovieParam recommendationMovieParam) async{
    return await baseMoviesRepository.getRecommendationMovies(recommendationMovieParam);
  }
}
class RecommendationMovieParam extends Equatable{
final int id;

const RecommendationMovieParam({required this.id});

@override
// TODO: implement props
List<Object?> get props => [id];
}