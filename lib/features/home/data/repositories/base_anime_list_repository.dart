import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/core/usecases/params.dart';

abstract class BaseAnimeListRepository {
  Future<List<Anime>> getAnimeList(PaginateParams params);
}
