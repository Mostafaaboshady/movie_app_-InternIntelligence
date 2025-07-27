import 'package:equatable/equatable.dart';

class EpisodesModel extends Equatable {
  const EpisodesModel({
    required this.id,
    required this.airDate,
    required this.episodes,
    required this.name,
    required this.overview,
    required this.episodesModelId,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final String? id;
  final DateTime? airDate;
  final List<Episode> episodes;
  final String? name;
  final String? overview;
  final int? episodesModelId;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  factory EpisodesModel.fromJson(Map<String, dynamic> json) {
    return EpisodesModel(
      id: json["_id"],
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodes: json["episodes"] == null
          ? []
          : List<Episode>.from(
              json["episodes"]!.map((x) => Episode.fromJson(x))),
      name: json["name"],
      overview: json["overview"],
      episodesModelId: json["id"],
      posterPath: json["poster_path"],
      seasonNumber: json["season_number"],
      voteAverage: json["vote_average"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        airDate,
        episodes,
        name,
        overview,
        episodesModelId,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}

class Episode extends Equatable {
  const Episode({
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.id,
    required this.name,
    required this.overview,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
    required this.voteAverage,
    required this.voteCount,
    required this.crew,
    required this.guestStars,
  });

  final DateTime? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final int? id;
  final String? name;
  final String? overview;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final dynamic stillPath;
  final double? voteAverage;
  final int? voteCount;
  final List<dynamic> crew;
  final List<dynamic> guestStars;

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeNumber: json["episode_number"],
      episodeType: json["episode_type"],
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      productionCode: json["production_code"],
      runtime: json["runtime"],
      seasonNumber: json["season_number"],
      showId: json["show_id"],
      stillPath: json["still_path"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      crew: json["crew"] == null
          ? []
          : List<dynamic>.from(json["crew"]!.map((x) => x)),
      guestStars: json["guest_stars"] == null
          ? []
          : List<dynamic>.from(json["guest_stars"]!.map((x) => x)),
    );
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeNumber,
        episodeType,
        id,
        name,
        overview,
        productionCode,
        runtime,
        seasonNumber,
        showId,
        stillPath,
        voteAverage,
        voteCount,
        crew,
        guestStars,
      ];
}
