import 'package:clean_arch_app/core/base_usecase/base_usecase.dart';
import 'package:clean_arch_app/movies/domain/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/top_rated_entities.dart';

class GetTopRatedMoviesUseCase extends BaseUseCase<List<TopRatedEntities>,NoParameters>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUseCase({required this.baseMoviesRepository});
  @override
 Future<Either<Failure,List<TopRatedEntities>>> call(NoParameters noParameters)async{
    return await baseMoviesRepository.getTopRatedMovies();
  }
}