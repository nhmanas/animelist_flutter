import 'package:animelist/features/home/home.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeListState extends Equatable {
  const AnimeListState();
}

class GetAnimeListInitialState extends AnimeListState {
  @override
  List<Object?> get props => [];
}

class GetAnimeListLoadedState extends AnimeListState {
  const GetAnimeListLoadedState({required this.list});
  final List<Anime> list;
  @override
  List<Object?> get props => [list];
}

class GetAnimeListErrorState extends AnimeListState {
  const GetAnimeListErrorState({required this.error});
  final dynamic error;
  @override
  List<Object?> get props => [error];
}
