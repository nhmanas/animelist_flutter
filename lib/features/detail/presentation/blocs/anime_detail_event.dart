import 'package:equatable/equatable.dart';

abstract class AnimeDetailEvent extends Equatable {
  const AnimeDetailEvent();
}

class GetAnimeDetailEvent extends AnimeDetailEvent {
  const GetAnimeDetailEvent({required this.animeId});
  final String animeId;
  @override
  List<Object?> get props => [];
}
