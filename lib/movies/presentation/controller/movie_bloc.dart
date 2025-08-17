import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/core/utilities/request_enum.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';

import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  // final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc({required this.getNowPlayingMoviesUseCase,required this.getPopularMoviesUseCase}) : super(MovieStates()){
    on<GetNowPlayingMoviesEvent>((event, emit) async{
     final result =await getNowPlayingMoviesUseCase.execute();
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
    on<GetPopularMoviesEvent>((event,emit)async{
      final result =await getPopularMoviesUseCase.execute();
      print(result);
      return result.fold(
              (left){
            emit(
              MovieStates(
                   popularMoviesErrorMessage: left.message,
                  popularMoviesRequestState: RequestState.error),
            );
          },
              (right){
            emit(
                MovieStates(
                    popularMoviesList: right,
                    popularMoviesRequestState: RequestState.loaded));
          }
      );
    });
    // on<GetTopRatedMoviesEvent>((event,emit)async{
    //   final result =await getTopRatedMoviesUseCase.execute();
    //   print(result);
    //   return result.fold(
    //           (left){
    //         emit(
    //           MovieStates(
    //                topRatedMoviesErrorMessage: left.message,
    //               topRatedMoviesRequestState: RequestState.error),
    //         );
    //       },
    //           (right){
    //         emit(
    //             MovieStates(
    //                 topRatedMoviesList: right,
    //                 topRatedMoviesRequestState: RequestState.loaded));
    //       }
    //   );
    // });
  }
}