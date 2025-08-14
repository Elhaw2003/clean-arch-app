import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/core/utilities/request_enum.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';

import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MovieBloc({required this.getNowPlayingMoviesUseCase}) : super(MovieStates()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{
     final result =await getNowPlayingMoviesUseCase.execute();
     emit(MovieStates(nowPlayingMoviesRequestState: RequestState.loaded));
     print(result);
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