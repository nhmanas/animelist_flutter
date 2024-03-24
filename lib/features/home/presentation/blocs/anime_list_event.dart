import 'package:animelist/core/usecases/params.dart';
import 'package:equatable/equatable.dart';

abstract class AnimeListEvent extends Equatable {
  const AnimeListEvent();
}

class GetAnimeListEvent extends AnimeListEvent {
  const GetAnimeListEvent({required this.paginateParams});
  final PaginateParams paginateParams;
  @override
  List<Object?> get props => [];
}
