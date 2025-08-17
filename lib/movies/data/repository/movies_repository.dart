import 'package:clean_arch_app/core/error/failure.dart';
import 'package:clean_arch_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/top_rated_entities.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/exception.dart';

class MoviesRepository extends BaseMoviesRepository {
  MoviesRepository({required this.baseMoviesRemoteDataSource});
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  @override
  Future<Either<Failure, List<NowPlayingEntities>>> getNowPlayingMovies() async {
    try {
      final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<PopularEntities>>> getPopularMovies() async {
    try {
      final result = await baseMoviesRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TopRatedEntities>>> getTopRatedMovies() async {
    try {
      final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.errorMessageModel.statusMessage));
    }
  }
}
