import 'package:animelist/features/detail/presentation/blocs/anime_detail_bloc.dart';
import 'package:animelist/features/detail/presentation/blocs/anime_detail_event.dart';
import 'package:animelist/features/detail/presentation/blocs/anime_detail_state.dart';
import 'package:animelist/features/detail/presentation/widgets/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.animeId}) : super(key: key);
  final String animeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime Detail'),
      ),
      body: BlocBuilder(
        bloc: AnimeDetailBloc()..add(GetAnimeDetailEvent(animeId: animeId)),
        builder: (context, state) {
          if (state is GetAnimeDetailInitialState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetAnimeDetailLoadedState) {
            final anime = state.anime;
            return DetailView(anime: anime, characterResponse: state.list);
          } else if (state is GetAnimeDetailErrorState) {
            return Text(state.error.toString());
          } else {
            return const Text('Unknown error');
          }
        },
      ),
    );
  }
}
