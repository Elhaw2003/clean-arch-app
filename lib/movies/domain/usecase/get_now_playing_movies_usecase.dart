import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

import '../entities/now_playing_entities.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});
 Future<Either<Failure,List<NowPlayingEntities>>> execute()async{
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}