import 'package:clean_arch_app/core/error/failure.dart';
import 'package:clean_arch_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_arch_app/movies/domain/entities/movie_details_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/top_rated_entities.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/exception.dart';
import '../../domain/usecase/get_details_movies_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  MoviesRepository({required this.baseMoviesRemoteDataSource});
  final BaseMoviesRemoteDataSource baseMoviesRemoteDataSource;

  @override
  Future<Either<Failure, List<NowPlayingEntities>>> getNowPlayingMovies() async {
    try {
      final result = await baseMoviesRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.errorMessageModel.statusMessage?? "Unknown Error"));
    }
  }

  @override
  Future<Either<Failure, List<PopularEntities>>> getPopularMovies() async {
    try {
      final result = await baseMoviesRemoteDataSource.getPopularMovies();
      print("============================= $result ======================");
      return Right(result);
    }on DioException catch (e) {
      print("Status code: ${e.response?.statusCode}");
      print("Response data: ${e.response?.data}");
      return Left(ApiFailure( message: e.response?.data.toString() ?? "Unknown Error"));
    }
    on ServerException catch (e) {
  print("API Error: ${e.errorMessageModel.statusMessage?? "Unknown Error"}");
  return Left(ApiFailure(message: e.errorMessageModel.statusMessage?? "Unknown Error"));
  }
  }

  @override
  Future<Either<Failure, List<TopRatedEntities>>> getTopRatedMovies() async {
    try {
      final result = await baseMoviesRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.errorMessageModel.statusMessage?? "Unknown Error"));
    }
  }

  @override
  Future<Either<Failure, MovieDetailsEntities>> getMovieDetails(MovieDetailsParam movieDetailsParam) async{
    try {
      final result = await baseMoviesRemoteDataSource.getDetailsMovies(movieDetailsParam);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ApiFailure(message: e.errorMessageModel.statusMessage?? "Unknown Error"));
    }
  }
}
