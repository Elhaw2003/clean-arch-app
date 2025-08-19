import 'package:clean_arch_app/core/base_usecase/base_usecase.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';

import '../entities/now_playing_entities.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<NowPlayingEntities>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetNowPlayingMoviesUseCase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<NowPlayingEntities>>> call(NoParameters noParameters) async{
  return  await baseMoviesRepository.getNowPlayingMovies();
  }

}