import 'package:clean_arch_app/movies/domain/entities/movie_details_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/top_rated_entities.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
// contract ............
abstract class BaseMoviesRepository {
  Future<Either<Failure, List<NowPlayingEntities>>> getNowPlayingMovies();
  Future<Either<Failure,List<PopularEntities>>> getPopularMovies();
  Future<Either<Failure,List<TopRatedEntities>>> getTopRatedMovies();
  Future<Either<Failure,MovieDetailsEntities>> getMovieDetails(int id);
}