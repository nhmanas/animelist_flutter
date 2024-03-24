import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/core/data/models/paginated_data.dart';
import 'package:animelist/core/usecases/params.dart';
import 'package:animelist/features/home/data/data_sources/anime_list_data_source.dart';
import 'package:animelist/features/home/data/data_sources/base_anime_list_data_source.dart';
import 'package:animelist/features/home/data/repositories/base_anime_list_repository.dart';
import 'package:flutter/material.dart';

class AnimeListRepository extends BaseAnimeListRepository {
  AnimeListRepository({BaseAnimeListDataSource? animeListDataSource}) {
    _animeListDataSource = animeListDataSource ?? AnimeListDataSource();
  }
  late final BaseAnimeListDataSource _animeListDataSource;

  @override
  Future<List<Anime>> getAnimeList(PaginateParams params) async {
    final response = await _animeListDataSource.getAnimeList(params);
    final decodedResponse = PaginatedData<List<Anime>>.fromJson(
      response,
      Anime.getAnimeListFromResponse(response),
    );
    debugPrint(decodedResponse.toString());
    final list = decodedResponse.data;
    debugPrint(list.toString());
    return list;
  }
}
