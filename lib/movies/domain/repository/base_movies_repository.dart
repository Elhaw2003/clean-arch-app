import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/entities/top_rated_entities.dart';
// contract ............
abstract class BaseMoviesRepository {
  Future<List<NowPlayingEntities>> getNowPlayingMovies();
  Future<List<PopularEntities>> getPopularMovies();
  Future<List<TopRatedEntities>> getTopRatedMovies();
}