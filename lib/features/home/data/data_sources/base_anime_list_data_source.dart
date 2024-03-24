import 'package:animelist/core/usecases/params.dart';

abstract class BaseAnimeListDataSource {
  Future<Map<String, dynamic>> getAnimeList(PaginateParams params);
}
