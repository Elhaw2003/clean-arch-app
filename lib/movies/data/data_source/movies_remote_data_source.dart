import 'package:clean_arch_app/core/utilities/app_texts.dart';
import 'package:clean_arch_app/core/utilities/end_points.dart';
import 'package:clean_arch_app/movies/data/models/now_playing_movies_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/error/error_message_model.dart';
import '../../../core/error/exception.dart';
import '../../../core/error/failure.dart';
import '../models/popular_movies_model.dart';
import '../models/top_rated_movies_model.dart';


// Contract
abstract class BaseMoviesRemoteDataSource {
  Future<List<NowPlayingMoviesModel>> getNowPlayingMovies();
  Future<List<PopularMoviesModel>> getPopularMovies();
  Future<List<TopRatedMoviesModel>> getTopRatedMovies();

}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<NowPlayingMoviesModel>> getNowPlayingMovies() async {

      final response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .nowPlayingEndPoint}?api_key=${EndPoints.apiKey}");
      print("============================= ${response} ======================");
      try{
        if (response.statusCode == 200) {
          // print("============================= ${response.data} ======================");
          return List<NowPlayingMoviesModel>.from((response.data["results"] as List).map((e) => NowPlayingMoviesModel.fromJson(e),
          ));
        }
        else {
          print("============================= ${response.data} ======================");
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }catch (e){
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
  }
  @override
  Future< List<PopularMoviesModel>> getPopularMovies() async {
      var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .popularMovieEndPoint}? api_key = ${EndPoints.apiKey}");
      try{
        if (response.statusCode == 200) {
         return List<PopularMoviesModel>.from((response.data["results"] as List).map((e) =>
              PopularMoviesModel.fromJson(e),
         ));
        }
    else {
          print("============================= ${response.data} ======================");
    throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));      }
      }
      catch (e){
        throw ApiFailure(message: "hgjffhgfgdhgdjghkj");
      }
  }

  @override
  Future< List<TopRatedMoviesModel>> getTopRatedMovies() async {
      var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .topRatedMovieEndPoint}?api_key=${EndPoints.apiKey}");
      if (response.statusCode == 200) {
        List<TopRatedMoviesModel> list = response.data["results"].map((e) =>
            TopRatedMoviesModel.fromJson(e)).toList();
        return list;
      }
      else {
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }

}