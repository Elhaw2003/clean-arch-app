
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clean_arch_app/core/utilities/constants.dart';
import 'package:clean_arch_app/movies/presentation/controller/movie_bloc.dart';
import 'package:clean_arch_app/movies/presentation/controller/movie_event.dart';
import 'package:clean_arch_app/movies/presentation/view/widgets/now_playing_movie_widget.dart';
import 'package:clean_arch_app/movies/presentation/view/widgets/popular_movie_widget.dart';
import 'package:clean_arch_app/movies/presentation/view/widgets/top_rated_movie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/services/service_locator.dart';
import 'dummy.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl<MovieBloc>()..add(GetNowPlayingMoviesEvent())..add(GetPopularMoviesEvent())..add(GetTopRatedMoviesEvent()),
  child: Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SingleChildScrollView(
        key: const Key('movieScrollView'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NowPlayingMovieWidget(),
            PopularMovieWidget(),
            TopRatedMovieWidget(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    ),
);
  }
}
