import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/features/home/presentation/widgets/anime_list_tile.dart';
import 'package:flutter/material.dart';

class AnimeListScreen extends StatelessWidget {
  const AnimeListScreen({Key? key, required this.list}) : super(key: key);
  final List<Anime> list;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
        itemCount: list.length + 1,
        itemBuilder: (context, index) {
          if (index < list.length) {
            return AnimeListTile(item: list[index]);
          } else {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 32),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
