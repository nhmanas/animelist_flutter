class Anime {
  Anime({
    required this.malId,
    required this.url,
    required this.images,
    required this.title,
    required this.episodes,
    required this.status,
    required this.duration,
    required this.score,
    required this.synopsis,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => Anime(
        malId: json['mal_id'] as int,
        url: json['url'] as String,
        images: Images.fromJson(json['images'] as Map<String, dynamic>),
        title: json['title'] as String,
        episodes: json['episodes'] as int,
        status: json['status'] as String,
        duration: json['duration'] as String,
        score: json['score'] as double,
        synopsis: json['synopsis'] as String,
      );
  final int malId;
  final String url;
  final Images images;
  final String title;
  final int episodes;
  final String status;
  final String duration;
  final double score;
  final String synopsis;

  static List<Anime> getAnimeListFromResponse(
    Map<String, dynamic> json,
  ) {
    return (json['data'] as List<dynamic>)
        .asMap()
        .entries
        .map((entry) => Anime.fromJson(entry.value as Map<String, dynamic>))
        .toList();
  }

  Anime copyWith({
    int? malId,
    String? url,
    Images? images,
    String? title,
    int? episodes,
    String? status,
    String? duration,
    double? score,
    String? synopsis,
  }) {
    return Anime(
      malId: malId ?? this.malId,
      url: url ?? this.url,
      images: images ?? this.images,
      title: title ?? this.title,
      episodes: episodes ?? this.episodes,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      score: score ?? this.score,
      synopsis: synopsis ?? this.synopsis,
    );
  }
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
