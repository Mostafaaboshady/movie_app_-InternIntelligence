import 'package:equatable/equatable.dart';

class MoviesDetailModel extends Equatable {
  const MoviesDetailModel({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    required this.videos,
    required this.credits,
    required this.reviews,
    required this.similar,
  });

  final bool? adult;
  final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genre> genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final List<String> originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final Videos? videos;
  final Credits? credits;
  final Reviews? reviews;
  final Similar? similar;

  factory MoviesDetailModel.fromJson(Map<String, dynamic> json) {
    return MoviesDetailModel(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      belongsToCollection: json["belongs_to_collection"] == null
          ? null
          : BelongsToCollection.fromJson(json["belongs_to_collection"]),
      budget: json["budget"],
      genres: json["genres"] == null
          ? []
          : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      homepage: json["homepage"],
      id: json["id"],
      imdbId: json["imdb_id"],
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]!.map((x) => x)),
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      productionCompanies: json["production_companies"] == null
          ? []
          : List<ProductionCompany>.from(json["production_companies"]!
              .map((x) => ProductionCompany.fromJson(x))),
      productionCountries: json["production_countries"] == null
          ? []
          : List<ProductionCountry>.from(json["production_countries"]!
              .map((x) => ProductionCountry.fromJson(x))),
      releaseDate: DateTime.tryParse(json["release_date"] ?? ""),
      revenue: json["revenue"],
      runtime: json["runtime"],
      spokenLanguages: json["spoken_languages"] == null
          ? []
          : List<SpokenLanguage>.from(
              json["spoken_languages"]!.map((x) => SpokenLanguage.fromJson(x))),
      status: json["status"],
      tagline: json["tagline"],
      title: json["title"],
      video: json["video"],
      voteAverage: json["vote_average"],
      voteCount: json["vote_count"],
      videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
      credits:
          json["credits"] == null ? null : Credits.fromJson(json["credits"]),
      reviews:
          json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
      similar:
          json["similar"] == null ? null : Similar.fromJson(json["similar"]),
    );
  }

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        belongsToCollection,
        budget,
        genres,
        homepage,
        id,
        imdbId,
        originCountry,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        productionCompanies,
        productionCountries,
        releaseDate,
        revenue,
        runtime,
        spokenLanguages,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
        videos,
        credits,
        reviews,
        similar,
      ];
}

class BelongsToCollection extends Equatable {
  const BelongsToCollection({
    required this.id,
    required this.name,
    required this.posterPath,
    required this.backdropPath,
  });

  final int? id;
  final String? name;
  final String? posterPath;
  final String? backdropPath;

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json["id"],
      name: json["name"],
      posterPath: json["poster_path"],
      backdropPath: json["backdrop_path"],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        posterPath,
        backdropPath,
      ];
}

class Credits extends Equatable {
  const Credits({
    required this.cast,
    required this.crew,
  });

  final List<Cast> cast;
  final List<Cast> crew;

  factory Credits.fromJson(Map<String, dynamic> json) {
    return Credits(
      cast: json["cast"] == null
          ? []
          : List<Cast>.from(json["cast"]!.map((x) => Cast.fromJson(x))),
      crew: json["crew"] == null
          ? []
          : List<Cast>.from(json["crew"]!.map((x) => Cast.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        cast,
        crew,
      ];
}

class Cast extends Equatable {
  const Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
    required this.department,
    required this.job,
  });

  final bool? adult;
  final int? gender;
  final int? id;
  final String? knownForDepartment;
  final String? name;
  final String? originalName;
  final double? popularity;
  final String? profilePath;
  final int? castId;
  final String? character;
  final String? creditId;
  final int? order;
  final String? department;
  final String? job;

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      adult: json["adult"],
      gender: json["gender"],
      id: json["id"],
      knownForDepartment: json["known_for_department"],
      name: json["name"],
      originalName: json["original_name"],
      popularity: json["popularity"],
      profilePath: json["profile_path"],
      castId: json["cast_id"],
      character: json["character"],
      creditId: json["credit_id"],
      order: json["order"],
      department: json["department"],
      job: json["job"],
    );
  }

  @override
  List<Object?> get props => [
        adult,
        gender,
        id,
        knownForDepartment,
        name,
        originalName,
        popularity,
        profilePath,
        castId,
        character,
        creditId,
        order,
        department,
        job,
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

class ProductionCompany extends Equatable {
  const ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int? id;
  final String? logoPath;
  final String? name;
  final String? originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
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

class Reviews extends Equatable {
  const Reviews({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int? page;
  final List<ReviewsResult> results;
  final int? totalPages;
  final int? totalResults;

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
      page: json["page"],
      results: json["results"] == null
          ? []
          : List<ReviewsResult>.from(
              json["results"]!.map((x) => ReviewsResult.fromJson(x))),
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

class ReviewsResult extends Equatable {
  const ReviewsResult({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  factory ReviewsResult.fromJson(Map<String, dynamic> json) {
    return ReviewsResult(
      author: json["author"],
      authorDetails: json["author_details"] == null
          ? null
          : AuthorDetails.fromJson(json["author_details"]),
      content: json["content"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      id: json["id"],
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
      url: json["url"],
    );
  }

  @override
  List<Object?> get props => [
        author,
        authorDetails,
        content,
        createdAt,
        id,
        updatedAt,
        url,
      ];
}

class AuthorDetails extends Equatable {
  const AuthorDetails({
    required this.name,
    required this.username,
    required this.avatarPath,
    required this.rating,
  });

  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) {
    return AuthorDetails(
      name: json["name"],
      username: json["username"],
      avatarPath: json["avatar_path"],
      rating: json["rating"],
    );
  }

  @override
  List<Object?> get props => [
        name,
        username,
        avatarPath,
        rating,
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
  final List<SimilarResult> results;
  final int? totalPages;
  final int? totalResults;

  factory Similar.fromJson(Map<String, dynamic> json) {
    return Similar(
      page: json["page"],
      results: json["results"] == null
          ? []
          : List<SimilarResult>.from(
              json["results"]!.map((x) => SimilarResult.fromJson(x))),
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

class SimilarResult extends Equatable {
  const SimilarResult({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int? id;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory SimilarResult.fromJson(Map<String, dynamic> json) {
    return SimilarResult(
      adult: json["adult"],
      backdropPath: json["backdrop_path"],
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from(json["genre_ids"]!.map((x) => x)),
      id: json["id"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      popularity: json["popularity"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
      title: json["title"],
      video: json["video"],
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
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
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

class Videos extends Equatable {
  const Videos({
    required this.results,
  });

  final List<VideosResult> results;

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      results: json["results"] == null
          ? []
          : List<VideosResult>.from(
              json["results"]!.map((x) => VideosResult.fromJson(x))),
    );
  }

  @override
  List<Object?> get props => [
        results,
      ];
}

class VideosResult extends Equatable {
  const VideosResult({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  final String? iso6391;
  final String? iso31661;
  final String? name;
  final String? key;
  final String? site;
  final int? size;
  final String? type;
  final bool? official;
  final DateTime? publishedAt;
  final String? id;

  factory VideosResult.fromJson(Map<String, dynamic> json) {
    return VideosResult(
      iso6391: json["iso_639_1"],
      iso31661: json["iso_3166_1"],
      name: json["name"],
      key: json["key"],
      site: json["site"],
      size: json["size"],
      type: json["type"],
      official: json["official"],
      publishedAt: DateTime.tryParse(json["published_at"] ?? ""),
      id: json["id"],
    );
  }

  @override
  List<Object?> get props => [
        iso6391,
        iso31661,
        name,
        key,
        site,
        size,
        type,
        official,
        publishedAt,
        id,
      ];
}
