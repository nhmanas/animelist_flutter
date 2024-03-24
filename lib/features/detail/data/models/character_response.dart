class CharacterResponse {
  CharacterResponse({
    required this.data,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      final dataList = json['data'] as List;
      final characters = dataList
          .map((dynamic e) => Character.fromJson(e as Map<String, dynamic>))
          .toList();
      return CharacterResponse(data: characters);
    } else {
      throw Exception('Failed to load character response');
    }
  }

  final List<Character> data;
}

class Character {
  Character({
    required this.character,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        character: CharacterDetails.fromJson(
          json['character'] as Map<String, dynamic>,
        ),
      );

  final CharacterDetails character;
}

class CharacterDetails {
  CharacterDetails({
    required this.malId,
    required this.url,
    required this.images,
    required this.name,
  });

  factory CharacterDetails.fromJson(Map<String, dynamic> json) =>
      CharacterDetails(
        malId: json['mal_id'] as int,
        url: json['url'] as String,
        images: Images.fromJson(json['images'] as Map<String, dynamic>),
        name: json['name'] as String,
      );

  final int malId;
  final String url;
  final Images images;
  final String name;
}

class Images {
  Images({
    required this.jpg,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        jpg: Jpg.fromJson(json['jpg'] as Map<String, dynamic>),
      );
  final Jpg jpg;
}

class Jpg {
  Jpg({
    required this.imageUrl,
  });

  factory Jpg.fromJson(Map<String, dynamic> json) => Jpg(
        imageUrl: json['image_url'] as String,
      );
  final String imageUrl;
}
