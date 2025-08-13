import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/core/utilities/request_enum.dart';
import 'package:clean_arch_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_arch_app/movies/data/repository/movies_repository.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';

import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieStates> {
  MovieBloc() : super(MovieStates()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{
      // emit(MovieStates(nowPlayingMoviesRequestState: RequestState.loading));
      BaseMoviesRemoteDataSource baseMoviesRemoteDataSource = MoviesRemoteDataSource();
      BaseMoviesRepository baseMoviesRepository = MoviesRepository(baseMoviesRemoteDataSource: baseMoviesRemoteDataSource);
     final result =await GetNowPlayingMoviesUseCase(baseMoviesRepository: baseMoviesRepository).execute();
     return result.fold(
             (left){
               emit(
                 MovieStates(
                     nowPlayingMoviesErrorMessage: left.message,
                   nowPlayingMoviesRequestState: RequestState.error),
               );
             },
             (right){
               emit(
                   MovieStates(
                       nowPlayingMoviesList: right,
                       nowPlayingMoviesRequestState: RequestState.loaded));
             }
     );
    });
  }
}