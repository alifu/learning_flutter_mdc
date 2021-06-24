import 'package:flutter/material.dart';

class TabItemUiModel {
  TabItemUiModel(this.label, this.id);

  final String label;
  final int id;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  bool operator ==(Object other) =>
      other is TabItemUiModel &&
      label == other.label &&
      id == other.id &&
      navigatorKey == other.navigatorKey;

  @override
  int get hashCode {
    int result = label.hashCode;
    result = 31 * result + id.hashCode;
    result = 31 * result + navigatorKey.hashCode;
    return result;
  }
}

class MovieGenreUiModel {
  MovieGenreUiModel(this.name, this.id);

  final String name;
  final int id;

  @override
  bool operator ==(Object other) =>
      other is MovieGenreUiModel && name == other.name && id == other.id;

  @override
  int get hashCode {
    int result = name.hashCode;
    result = 31 * result + id.hashCode;
    return result;
  }
}

class MovieItemUiModel {
  MovieItemUiModel(this.id, this.title, this.rating, this.image);

  final int id;
  final String title;
  final double rating;
  final String image;

  @override
  bool operator ==(Object other) =>
      other is MovieItemUiModel &&
      id == other.id &&
      title == other.title &&
      image == other.image &&
      rating == other.rating;

  @override
  int get hashCode {
    int result = id.hashCode;
    result = 31 * result + title.hashCode;
    result = 31 * result + rating.hashCode;
    result = 31 * result + image.hashCode;
    return result;
  }
}
