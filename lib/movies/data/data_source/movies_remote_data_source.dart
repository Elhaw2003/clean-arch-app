import 'package:clean_arch_app/core/utilities/app_texts.dart';
import 'package:clean_arch_app/core/utilities/end_points.dart';
import 'package:clean_arch_app/movies/data/models/now_playing_movies_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/failure.dart';
import '../models/popular_movies_model.dart';
import '../models/top_rated_movies_model.dart';


// Contract
abstract class BaseMoviesRemoteDataSource {
  Future<Either<Failure, List<NowPlayingMoviesModel>>> getNowPlayingMovies();
  Future<Either<Failure, List<PopularMoviesModel>>> getPopularMovies();
  Future<Either<Failure, List<TopRatedMoviesModel>>> getTopRatedMovies();

}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<Either<Failure, List<NowPlayingMoviesModel>>> getNowPlayingMovies() async {
    try {
      var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .nowPlayingEndPoint}api_key=${EndPoints.apiKey}");
      if (response.statusCode == 200) {
          List<NowPlayingMoviesModel> list = response.data["results"].map((e) =>
              NowPlayingMoviesModel.fromJson(e)).toList();
          return right(list);
      }
      else {
        return left(ApiFailure(message: response.data["status_message"]));
      }
    }
    catch (e){
      return left(ApiFailure(message: AppTexts.opsError));
    }
  }
  @override
  Future<Either<Failure, List<PopularMoviesModel>>> getPopularMovies() async {
    try {
      var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .popularMovieEndPoint}api_key=${EndPoints.apiKey}");
      if (response.statusCode == 200) {
        List<PopularMoviesModel> list = response.data["results"].map((e) =>
            PopularMoviesModel.fromJson(e)).toList();
        return right(list);
      }
      else {
        return left(ApiFailure(message: response.data["status_message"]));
      }
    }
    catch (e){
      return left(ApiFailure(message: AppTexts.opsError));
    }
  }

  @override
  Future<Either<Failure, List<TopRatedMoviesModel>>> getTopRatedMovies() async {
    try {
      var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .topRatedMovieEndPoint}api_key=${EndPoints.apiKey}");
      if (response.statusCode == 200) {
        List<TopRatedMoviesModel> list = response.data["results"].map((e) =>
            TopRatedMoviesModel.fromJson(e)).toList();
        return right(list);
      }
      else {
        return left(ApiFailure(message: response.data["status_message"]));
      }
    }
    catch (e){
      return left(ApiFailure(message: AppTexts.opsError));
    }
  }

}