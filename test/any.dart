import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/core/data/models/paginated_data.dart';

import 'dummy.dart';

class Any {
  static PaginatedData<List<Anime>> paginatedAnimeList =
      PaginatedData<List<Anime>>.fromJson(
    Dummy.animeListResponse,
    Anime.getAnimeListFromResponse(Dummy.animeListResponse),
  );
}
