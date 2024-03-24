import 'package:animelist/app/locator.dart';
import 'package:animelist/features/detail/domain/usecases/get_anime_detail_use_case.dart';
import 'package:animelist/features/detail/presentation/blocs/anime_detail_event.dart';
import 'package:animelist/features/detail/presentation/blocs/anime_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetailBloc extends Bloc<GetAnimeDetailEvent, AnimeDetailState?> {
  AnimeDetailBloc() : super(null) {
    final _getAnimeDetailUseCase = getIt.get<GetAnimeDetailUseCase>();
    on<GetAnimeDetailEvent>(
      (event, emit) async {
        emit(GetAnimeDetailInitialState());
        try {
          final characters = await _getAnimeDetailUseCase.call(event.animeId);
          final anime = await _getAnimeDetailUseCase.callAnime(event.animeId);
          emit(GetAnimeDetailLoadedState(list: characters, anime: anime));
        } catch (e) {
          emit(GetAnimeDetailErrorState(error: e));
        }
      },
    );
  }
}
