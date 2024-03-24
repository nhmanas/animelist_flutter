import 'package:animelist/app/locator.dart';
import 'package:animelist/features/home/domain/usecases/get_anime_list_use_case.dart';
import 'package:animelist/features/home/presentation/blocs/anime_list_event.dart';
import 'package:animelist/features/home/presentation/blocs/anime_list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  AnimeListBloc() : super(GetAnimeListInitialState()) {
    final _getAnimeListUseCase = getIt.get<GetAnimeListUseCase>();
    on<GetAnimeListEvent>(
      (event, emit) async {
        emit(GetAnimeListInitialState());
        try {
          final animeList =
              await _getAnimeListUseCase.call(event.paginateParams);
          emit(GetAnimeListLoadedState(list: animeList));
        } catch (e) {
          emit(GetAnimeListErrorState(error: e));
        }
      },
    );
  }
}
