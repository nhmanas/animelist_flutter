import 'dart:async';

import 'package:animelist/core/core.dart';
import 'package:animelist/features/detail/data/data.dart';
import 'package:animelist/features/detail/domain/repositories/anime_detail_repository.dart';
import 'package:animelist/features/home/home.dart';

class GetAnimeDetailUseCase implements UseCase<CharacterResponse, String> {
  GetAnimeDetailUseCase(this.repository);
  final AnimeDetailRepository repository;

  @override
  Future<CharacterResponse> call(String animeId) {
    return repository.getCharacters(animeId);
  }

  Future<Anime> callAnime(String animeId) {
    return repository.getAnimeById(animeId);
  }
}
