import 'package:bloc/bloc.dart';
import 'package:clean_arch_app/core/utilities/request_enum.dart';
import 'package:clean_arch_app/movies/data/models/movie_detail_model.dart';
import 'package:clean_arch_app/movies/domain/entities/movie_details_entities.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecase/get_details_movies_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetDetailsMoviesUseCase getDetailsMoviesUseCase;
  MovieDetailsBloc({required this.getDetailsMoviesUseCase}) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async{
      final result =await getDetailsMoviesUseCase(MovieDetailsParam(id: event.id));
      return result.fold(
              (left){
                emit(state.copyWith(
                  movieDetailsErrorMessage: left.message,
                  movieDetailsRequestState: RequestState.error
                ));
              },
          (right){
                emit(state.copyWith(
                  movieDetailsEntities: right,
                  movieDetailsRequestState: RequestState.loaded
                ));
      });
    });
  }
}
