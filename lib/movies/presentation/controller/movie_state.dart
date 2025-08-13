import 'package:clean_arch_app/core/utilities/request_enum.dart';
import 'package:clean_arch_app/movies/data/models/now_playing_movies_model.dart';
import 'package:clean_arch_app/movies/domain/entities/now_playing_entities.dart';
import 'package:equatable/equatable.dart';

class MovieStates extends Equatable {
  final List<NowPlayingEntities> nowPlayingMoviesList;
  final RequestState nowPlayingMoviesRequestState;
  final String nowPlayingMoviesErrorMessage;
  const MovieStates({
    this.nowPlayingMoviesList = const [],
    this.nowPlayingMoviesRequestState = RequestState.loading,
    this.nowPlayingMoviesErrorMessage = "",
});

  @override
  // TODO: implement props
  List<Object?> get props => [nowPlayingMoviesList,nowPlayingMoviesRequestState,nowPlayingMoviesErrorMessage];
}