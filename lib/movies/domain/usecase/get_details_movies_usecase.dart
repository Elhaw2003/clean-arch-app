import 'package:clean_arch_app/core/base_usecase/base_usecase.dart';
import 'package:clean_arch_app/core/error/failure.dart';
import 'package:clean_arch_app/movies/domain/entities/movie_details_entities.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetDetailsMoviesUseCase extends BaseUseCase<MovieDetailsEntities,MovieDetailsParam>{
  final BaseMoviesRepository baseMoviesRepository ;
  GetDetailsMoviesUseCase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, MovieDetailsEntities>> call(MovieDetailsParam movieDetailsParam) async{
    return await baseMoviesRepository.getMovieDetails(movieDetailsParam);
  }
}
class MovieDetailsParam extends Equatable{
  final int id;

  const MovieDetailsParam({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}