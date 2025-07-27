import 'package:equatable/equatable.dart';

class ShowDetailModel extends Equatable {
  const ShowDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.createdBy,
    required this.episodeRunTime,
    required this.firstAirDate,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.inProduction,
    required this.languages,
    required this.lastAirDate,
    required this.lastEpisodeToAir,
    required this.name,
    required this.nextEpisodeToAir,
    required this.networks,
    required this.numberOfEpisodes,
    required this.numberOfSeasons,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.seasons,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.type,
    required this.voteAverage,
    required this.voteCount,
    required this.similar,
  });

  final bool? adult;
  final String? backdropPath;
  final List<dynamic> createdBy;
  final List<int> episodeRunTime;
  final DateTime? firstAirDate;
  final List<Genre> genres;
  final String? homepage;
  final int? id;
  final bool? inProduction;
  final List<String> languages;
  final DateTime? lastAirDate;
  final LastEpisodeToAir? lastEpisodeToAir;
  final String? name;
  final dynamic nextEpisodeToAir;
  final List<Network> networks;
  final int? numberOfEpisodes;
  final int? numberOfSeasons;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<dynamic> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final List<Season> seasons;
  final List<SpokenLanguage> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? type;
  final double? voteAverage;
  final int? voteCount;
  final Similar? similar;

  factory ShowDetailModel.fromJson(Map<String, dynamic> json) {
    return ShowDetailModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      createdBy: json["created_by"] == null
          ? []
          : List<dynamic>.from(json["created_by"]!.map((x) => x)),
      episodeRunTime: json["episode_run_time"] == null
          ? []
          : List<int>.from(json["episode_run_time"]!.map((x) => x)),
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      inProduction: json["in_production"],
      languages: json["languages"] == null
          ? []
          : List<String>.from(json["languages"]!.map((x) => x)),
      lastAirDate: DateTime.tryParse(json["last_air_date"] ?? ""),
      lastEpisodeToAir: json["last_episode_to_air"] == null
          ? null
          : LastEpisodeToAir.fromJson(json["last_episode_to_air"]),
      name: json["name"],
      nextEpisodeToAir: json["next_episode_to_air"],
      networks: json["networks"] == null
          ? []
          : List<Network>.from(
              json["networks"]!.map((x) => Network.fromJson(x))),
      numberOfEpisodes: json["number_of_episodes"],
      numberOfSeasons: json["number_of_seasons"],
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      productionCompanies: json["production_companies"] == null
          ? []
          : List<dynamic>.from(json["production_companies"]!.map((x) => x)),
      productionCountries: json["production_countries"] == null
          ? []
          : List<ProductionCountry>.from(json["production_countries"]!
              .map((x) => ProductionCountry.fromJson(x))),
      seasons: json["seasons"] == null
          ? []
          : List<Season>.from(json["seasons"]!.map((x) => Season.fromJson(x))),
      spokenLanguages: json["spoken_languages"] == null
          ? []
          : List<SpokenLanguage>.from(
              json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
      status: json["status"],
      tagline: json["tagline"],
      type: json["type"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      similar:
          json["similar"] == null ? null : Similar.fromJson(json["similar"]),
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        createdBy,
        episodeRunTime,
        firstAirDate,
        genres,
        homepage,
        id,
        inProduction,
        languages,
        lastAirDate,
        lastEpisodeToAir,
        name,
        nextEpisodeToAir,
        networks,
        numberOfEpisodes,
        numberOfSeasons,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        seasons,
        spokenLanguages,
        status,
        tagline,
        type,
        voteAverage,
        voteCount,
        similar,
      ];
}

class Genre extends Equatable {
  const Genre({
    required this.id,
    required this.name,
  });

  final int? id;
  final String? name;

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json["id"],
      name: json["name"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}

class LastEpisodeToAir extends Equatable {
  const LastEpisodeToAir({
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.airDate,
    required this.episodeNumber,
    required this.episodeType,
    required this.productionCode,
    required this.runtime,
    required this.seasonNumber,
    required this.showId,
    required this.stillPath,
  });

  final int? id;
  final String? name;
  final String? overview;
  final double? voteAverage;
  final int? voteCount;
  final DateTime? airDate;
  final int? episodeNumber;
  final String? episodeType;
  final String? productionCode;
  final int? runtime;
  final int? seasonNumber;
  final int? showId;
  final dynamic stillPath;

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    return LastEpisodeToAir(
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeNumber: json["episode_number"],
      episodeType: json["episode_type"],
      productionCode: json["production_code"],
      runtime: json["runtime"],
      seasonNumber: json["season_number"],
      showId: json["show_id"],
      stillPath: json["still_path"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        voteAverage,
        voteCount,
        airDate,
        episodeNumber,
        episodeType,
        productionCode,
        runtime,
        seasonNumber,
        showId,
        stillPath,
      ];
}

class Network extends Equatable {
  const Network({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      id: json["id"],
      logoPath: json["logo_path"],
      name: json["name"],
      originCountry: json["origin_country"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        logoPath,
        name,
        originCountry,
      ];
}

class ProductionCountry extends Equatable {
  const ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String? iso31661;
  final String? name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json["iso_3166_1"],
      name: json["name"],
    );
  }

  @override
  List<Object?> get props => [
        iso31661,
        name,
      ];
}

class Season extends Equatable {
  const Season({
    required this.airDate,
    required this.episodeCount,
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.seasonNumber,
    required this.voteAverage,
  });

  final DateTime? airDate;
  final int? episodeCount;
  final int? id;
  final String? name;
  final String? overview;
  final String? posterPath;
  final int? seasonNumber;
  final double? voteAverage;

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      airDate: DateTime.tryParse(json["air_date"] ?? ""),
      episodeCount: json["episode_count"],
      id: json["id"],
      name: json["name"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      seasonNumber: json["season_number"],
      voteAverage: json["vote_average"],
    );
  }

  @override
  List<Object?> get props => [
        airDate,
        episodeCount,
        id,
        name,
        overview,
        posterPath,
        seasonNumber,
        voteAverage,
      ];
}

class Similar extends Equatable {
  const Similar({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<Result> results;
  final int? totalPages;
  final int? totalResults;

  factory Similar.fromJson(Map<String, dynamic> json) {
    return Similar(
      page: json["page"],
      results: json["results"] == null
          ? []
          : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
      totalPages: json["total_pages"],
      totalResults: json["total_results"],
    );
  }

  @override
  List<Object?> get props => [
        page,
        results,
        totalPages,
        totalResults,
      ];
}

class Result extends Equatable {
  const Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalName,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.firstAirDate,
    required this.name,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int? id;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? firstAirDate;
  final String? name;
  final double? voteAverage;
  final int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalName: json["original_name"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      firstAirDate: DateTime.tryParse(json["first_air_date"] ?? ""),
      name: json["name"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        firstAirDate,
        name,
        voteAverage,
        voteCount,
      ];
}

class SpokenLanguage extends Equatable {
  const SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  final String? englishName;
  final String? iso6391;
  final String? name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json["english_name"],
      iso6391: json["iso_639_1"],
      name: json["name"],
    );
  }

  @override
  List<Object?> get props => [
        englishName,
        iso6391,
        name,
      ];
}
