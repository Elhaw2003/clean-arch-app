import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});
 Future<Either<Failure,List<PopularEntities>>> execute()async{
    return await baseMoviesRepository.getPopularMovies();
  }
}