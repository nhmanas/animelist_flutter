import 'package:animelist/features/detail/data/models/character_response.dart';
import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  const CharacterTile({Key? key, required this.characterDetails})
      : super(key: key);
  final CharacterDetails characterDetails;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        width: width / 2.35,
        child: Material(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Colors.grey.shade300,
              width: 0.5,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: width,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image(
                    height: width / 1.7,
                    fit: BoxFit.cover,
                    image: NetworkImage(characterDetails.images.jpg.imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  characterDetails.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
