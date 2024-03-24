import 'package:animelist/features/detail/domain/repositories/anime_detail_repository.dart';
import 'package:animelist/features/detail/domain/usecases/get_anime_detail_use_case.dart';
import 'package:animelist/features/home/domain/repositories/anime_list_repository.dart';
import 'package:animelist/features/home/domain/usecases/get_anime_list_use_case.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> setupLocator() async {
  getIt
    ..registerLazySingleton(() => GetAnimeListUseCase(AnimeListRepository()))
    ..registerLazySingleton(
      () => GetAnimeDetailUseCase(AnimeDetailRepository()),
    );
}
