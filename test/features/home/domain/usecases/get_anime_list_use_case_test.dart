import 'package:animelist/core/usecases/params.dart';
import 'package:animelist/features/home/domain/repositories/anime_list_repository.dart';
import 'package:animelist/features/home/domain/usecases/get_anime_list_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../any.dart';

class MockAnimeListRepository extends Mock implements AnimeListRepository {}

void main() {
  late GetAnimeListUseCase useCase;
  late AnimeListRepository mockRepository;
  const paginateParams = PaginateParams(page: 1, perPage: 25);

  setUp(() {
    mockRepository = MockAnimeListRepository();
    useCase = GetAnimeListUseCase(mockRepository);
  });

  group(GetAnimeListUseCase, () {
    test('Should get animelist from repository', () async {
      // arrange
      when(() => mockRepository.getAnimeList(paginateParams))
          .thenAnswer((_) async => Any.paginatedAnimeList.data);

      // actual
      final result = await useCase(paginateParams);

      // assert
      expect(result, Any.paginatedAnimeList.data);
      verify(() => mockRepository.getAnimeList(paginateParams));
    });
  });
}
