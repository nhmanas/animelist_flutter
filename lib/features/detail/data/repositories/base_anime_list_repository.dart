import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/features/detail/data/data.dart';

abstract class BaseAnimeDetailRepository {
  Future<CharacterResponse> getCharacters(String animeId);
  Future<Anime> getAnimeById(String animeId);
}
