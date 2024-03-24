import 'package:animelist/app/routes.dart';
import 'package:animelist/core/data/models/anime.dart';
import 'package:flutter/material.dart';

class AnimeListTile extends StatelessWidget {
  const AnimeListTile({Key? key, required this.item}) : super(key: key);
  final Anime item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRouter.router
          .push('/detail', extra: {'animeId': item.malId.toString()}),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
          child: ListTile(
            leading: SizedBox(
              width: 75,
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(item.images.jpg.imageUrl),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(item.title),
            ),
            subtitle: Text(
              item.synopsis,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(item.score.toString()),
          ),
        ),
      ),
    );
  }
}
