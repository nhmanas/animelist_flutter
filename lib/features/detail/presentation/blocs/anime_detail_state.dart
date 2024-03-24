import 'package:animelist/features/detail/data/data.dart';
import 'package:animelist/features/home/home.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeDetailState extends Equatable {
  const AnimeDetailState();
}

class GetAnimeDetailInitialState extends AnimeDetailState {
  @override
  List<Object?> get props => [];
}

class GetAnimeDetailLoadedState extends AnimeDetailState {
  const GetAnimeDetailLoadedState({required this.list, required this.anime});
  final CharacterResponse list;
  final Anime anime;
  @override
  List<Object?> get props => [list];
}

class GetAnimeDetailErrorState extends AnimeDetailState {
  const GetAnimeDetailErrorState({required this.error});
  final dynamic error;
  @override
  List<Object?> get props => [error];
}
