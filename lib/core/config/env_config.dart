// Project imports:

import 'package:insort_assignment/core/constants/enums.dart';

abstract class EnvConfig {
  abstract String appTitle;
  abstract Flavor flavor;
  abstract String apiBaseUrl;
  abstract String accessKey;
}

class DevEnvironment extends EnvConfig {
  @override
  String apiBaseUrl = "https://api.themoviedb.org/3/";

  @override
  String appTitle = "The Movie DB-Dev";

  @override
  Flavor flavor = Flavor.dev;

  @override
  String accessKey = "";

}

class ProdEnvironment extends EnvConfig {
  @override
  String apiBaseUrl = "https://api.themoviedb.org/3/";

  @override
  String appTitle = "The Movie DB";

  @override
  Flavor flavor = Flavor.prod;

  @override
  String accessKey = "";

}
