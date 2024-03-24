import 'package:animelist/core/data/models/anime.dart';
import 'package:animelist/features/detail/data/models/character_response.dart';
import 'package:animelist/features/detail/presentation/widgets/character_tile.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.anime,
    required this.characterResponse,
  }) : super(key: key);
  final Anime anime;
  final CharacterResponse characterResponse;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image(
                        height: height / 3,
                        width: width / 2.5,
                        fit: BoxFit.cover,
                        image: NetworkImage(anime.images.jpg.imageUrl),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            anime.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text('Number of Episodes: ${anime.episodes}'),
                          Text('Score: ${anime.score}/10'),
                          Text('Duration: ${anime.duration}'),
                          Text('Status: ${anime.status}'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(anime.synopsis),
                const SizedBox(
                  height: 28,
                ),
                Row(
                  children: const [
                    Text(
                      'Characters:',
                      style: TextStyle(fontSize: 24),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: width / 1.25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: characterResponse.data.length,
              itemBuilder: (context, index) {
                final item = characterResponse.data[index];
                return CharacterTile(characterDetails: item.character);
              },
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
