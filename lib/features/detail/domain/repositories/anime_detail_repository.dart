import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/features/detail/data/data.dart';
import 'package:animelist/features/detail/data/data_sources/anime_detail_data_source.dart';
import 'package:animelist/features/detail/data/data_sources/base_anime_detail_data_source.dart';
import 'package:animelist/features/detail/data/repositories/base_anime_list_repository.dart';
import 'package:flutter/material.dart';

class AnimeDetailRepository extends BaseAnimeDetailRepository {
  AnimeDetailRepository({BaseAnimeDetailDataSource? animeDetailDataSource}) {
    _animeDetailDataSource = animeDetailDataSource ?? AnimeDetailDataSource();
  }
  late final BaseAnimeDetailDataSource _animeDetailDataSource;

  @override
  Future<CharacterResponse> getCharacters(String animeId) async {
    final response = await _animeDetailDataSource.getCharacters(animeId);
    final decodedResponse = CharacterResponse.fromJson(response);
    debugPrint(decodedResponse.toString());
    return decodedResponse;
  }

  @override
  Future<Anime> getAnimeById(String animeId) async {
    final response = await _animeDetailDataSource.getAnimeById(animeId);
    final decodedResponse =
        Anime.fromJson(response['data'] as Map<String, dynamic>);
    debugPrint(decodedResponse.toString());
    return decodedResponse;
  }
}
