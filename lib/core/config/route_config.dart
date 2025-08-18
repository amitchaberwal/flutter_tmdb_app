// Flutter imports:
import 'package:flutter/material.dart';
import 'package:insort_assignment/features/home/view/home_view.dart';

class RouteNames {
  static const String home = "/";
  static const String movieDetail = "/movie_details";
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  RouteNames.home: (context) => const Home(),
};
