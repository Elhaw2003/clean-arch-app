import 'package:clean_arch_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_arch_app/movies/data/repository/movies_repository.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:clean_arch_app/movies/presentation/controller/movie_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
class ServiceLocator {
  void init(){
    /// MOVIE BLOC

    sl.registerFactory(() => MovieBloc(getNowPlayingMoviesUseCase: sl()),);

    /// MOVIE USE CASE
    sl.registerLazySingleton(()=> GetNowPlayingMoviesUseCase(baseMoviesRepository: sl()),);
    /// MOVIE REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(baseMoviesRemoteDataSource: sl()),);
    /// MOVIE DATASOURCE
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(() => MoviesRemoteDataSource(),);
  }
}
