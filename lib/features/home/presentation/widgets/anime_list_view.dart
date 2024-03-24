import 'package:animelist/core/usecases/params.dart';
import 'package:animelist/features/home/home.dart';
import 'package:animelist/features/home/presentation/blocs/anime_list_bloc.dart';
import 'package:animelist/features/home/presentation/blocs/anime_list_event.dart';
import 'package:animelist/features/home/presentation/blocs/anime_list_state.dart';
import 'package:animelist/features/home/presentation/widgets/anime_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AnimeListView extends StatefulWidget {
  const AnimeListView({Key? key}) : super(key: key);

  @override
  _AnimeListViewState createState() => _AnimeListViewState();
}

class _AnimeListViewState extends State<AnimeListView> {
  final PagingController<int, Anime> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    final bloc = context.read<AnimeListBloc>();
    try {
      bloc.add(
        GetAnimeListEvent(
          paginateParams: PaginateParams(page: pageKey, perPage: 25),
        ),
      );

      final nextPageKey = pageKey + 1;
      _pagingController.nextPageKey = nextPageKey;
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<AnimeListBloc, AnimeListState>(
        listenWhen: (previous, current) => previous != current,
        listener: (context, state) {
          if (state is GetAnimeListLoadedState) {
            _pagingController.appendPage(
              state.list,
              _pagingController.nextPageKey,
            );
          }
        },
        child: PagedListView<int, Anime>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Anime>(
            itemBuilder: (context, item, index) => AnimeListTile(
              item: item,
            ),
          ),
        ),
      );
}
