import 'dart:async';

import 'package:animelist/core/core.dart';
import 'package:animelist/core/usecases/params.dart';
import 'package:animelist/features/home/domain/repositories/anime_list_repository.dart';
import 'package:animelist/features/home/home.dart';

class GetAnimeListUseCase implements UseCase<List<Anime>, PaginateParams> {
  GetAnimeListUseCase(this.repository);
  final AnimeListRepository repository;

  @override
  Future<List<Anime>> call(PaginateParams params) {
    return repository.getAnimeList(params);
  }
}
