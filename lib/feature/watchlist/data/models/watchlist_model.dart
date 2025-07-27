import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviesapp/constants.dart';

part 'watchlist_model.g.dart';

@HiveType(typeId: 0)
class WatchlistModel extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String overView;

  @HiveField(2)
  final String year;

  @HiveField(3)
  final double rate;

  @HiveField(4)
  final String image;

  @HiveField(5)
  final int id;

  WatchlistModel({
    required this.title,
    required this.overView,
    required this.year,
    this.rate = 0.0,
    this.image = kImageNetwork,
    required this.id,
  });
}
