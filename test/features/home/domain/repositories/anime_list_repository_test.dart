import 'package:animelist/core/usecases/params.dart';
import 'package:animelist/features/home/data/data_sources/anime_list_data_source.dart';
import 'package:animelist/features/home/domain/repositories/anime_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../any.dart';
import '../../../../dummy.dart';

class MockAnimeListDataSource extends Mock implements AnimeListDataSource {}

void main() {
  late AnimeListDataSource mockAnimeListDataSource;
  late AnimeListRepository repository;
  const paginateParams = PaginateParams(page: 1, perPage: 25);

  setUp(() {
    mockAnimeListDataSource = MockAnimeListDataSource();
    repository =
        AnimeListRepository(animeListDataSource: mockAnimeListDataSource);
  });

  group(AnimeListRepository, () {
    group('getAnimeList', () {
      test('Should get full anime list correctly', () async {
        // arrange
        when(() => mockAnimeListDataSource.getAnimeList(paginateParams))
            .thenAnswer((_) async => Dummy.animeListResponse);

        // actual
        final result = await repository.getAnimeList(paginateParams);

        // assert
        expect(result, Any.paginatedAnimeList);
        verify(
          () => mockAnimeListDataSource.getAnimeList(paginateParams),
        );
      });
    });
  });
}
