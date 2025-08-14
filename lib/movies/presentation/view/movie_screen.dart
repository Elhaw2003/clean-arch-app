import 'package:clean_arch_app/core/services/service_locator.dart';
import 'package:clean_arch_app/movies/data/data_source/movies_remote_data_source.dart';
import 'package:clean_arch_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:clean_arch_app/movies/presentation/controller/movie_bloc.dart';
import 'package:clean_arch_app/movies/presentation/controller/movie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/movie_event.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(sl<MovieBloc>().hashCode);
    print(sl<MovieBloc>().hashCode);
    print(sl<MovieBloc>().hashCode);
    return BlocProvider(
      create: (context) =>
      MovieBloc(getNowPlayingMoviesUseCase: sl())
        ..add(GetNowPlayingMoviesEvent()),
      child: BlocBuilder<MovieBloc, MovieStates>(
        builder: (context, state) {
          return Scaffold();
        },
      ),
    );
  }
}
