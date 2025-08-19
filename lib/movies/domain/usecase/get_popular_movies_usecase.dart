import 'package:clean_arch_app/core/base_usecase/base_usecase.dart';
import 'package:clean_arch_app/movies/domain/entities/popular_entities.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<PopularEntities>,NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUseCase({required this.baseMoviesRepository});
  @override
 Future<Either<Failure,List<PopularEntities>>> call(NoParameters noParameters)async{
    return await baseMoviesRepository.getPopularMovies();
  }
}