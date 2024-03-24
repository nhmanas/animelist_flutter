abstract class BaseAnimeDetailDataSource {
  Future<Map<String, dynamic>> getCharacters(String animeId);
  Future<Map<String, dynamic>> getAnimeById(String animeId);
}
