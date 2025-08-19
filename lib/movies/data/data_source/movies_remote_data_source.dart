import 'package:clean_arch_app/core/utilities/app_texts.dart';
import 'package:clean_arch_app/core/utilities/end_points.dart';
import 'package:clean_arch_app/movies/data/models/movie_detail_model.dart';
import 'package:clean_arch_app/movies/data/models/now_playing_movies_model.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_details_movies_usecase.dart';
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
  Future<MovieDetailModel> getDetailsMovies(MovieDetailsParam movieDetailsParam);

}
class MoviesRemoteDataSource extends BaseMoviesRemoteDataSource{
  @override
  Future<List<NowPlayingMoviesModel>> getNowPlayingMovies() async {

      final response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .nowPlayingEndPoint}?api_key=${EndPoints.apiKey}");
      try{
        if (response.statusCode == 200) {
          // print("============================= ${response.data} ======================");
          return List<NowPlayingMoviesModel>.from((response.data["results"] as List).map((e) => NowPlayingMoviesModel.fromJson(e),
          ));
        }
        else {
          throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
        }
      }catch (e){
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
  }
  @override
  Future<List<PopularMoviesModel>> getPopularMovies() async {
    try {
      final response = await Dio().get(
        "${EndPoints.baseUrl}${EndPoints.popularMovieEndPoint}?api_key=${EndPoints.apiKey}",
      );

      if (response.statusCode == 200) {
        return List<PopularMoviesModel>.from(
          (response.data["results"] as List).map(
                (e) => PopularMoviesModel.fromJson(e),
          ),
        );
      } else {
        throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data),
        );
      }
    } on DioException catch (e) {
      print("DioException: ${e.message}");
      print("Response: ${e.response?.data}");
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusMessage: e.response?.statusMessage ?? "Dio Error",
          statusCode: e.response?.statusCode ?? 500,
          success: false,
        ),
      );
    } catch (e) {
      print("Unexpected error: $e");
      throw ServerException(
        errorMessageModel: ErrorMessageModel(
          statusMessage: e.toString(),
          statusCode: 500,
          success: false,
        ),
      );
    }
  }


  @override
  Future< List<TopRatedMoviesModel>> getTopRatedMovies() async {
      var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
          .topRatedMovieEndPoint}?api_key=${EndPoints.apiKey}");
      if (response.statusCode == 200) {
        return List<TopRatedMoviesModel>.from(
          (response.data["results"] as List).map(
                (e) => TopRatedMoviesModel.fromJson(e),
          ),
        );
      }
      else {
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  @override
  Future<MovieDetailModel> getDetailsMovies(MovieDetailsParam movieDetailsParam) async{
    var response = await Dio().get("${EndPoints.baseUrl}${EndPoints
        .detailsMovieEndPoint}/${movieDetailsParam.id}?api_key=${EndPoints.apiKey}");
    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(response.data);
    }
    else {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

}