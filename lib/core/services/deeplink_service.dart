// Package imports:
import 'package:app_links/app_links.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:insort_assignment/core/config/app_config.dart';
import 'package:insort_assignment/core/extensions/utils_extensions.dart';
import 'package:insort_assignment/core/utils/data_utils.dart';
import 'package:insort_assignment/features/home/controller/home_bloc.dart';
import 'package:insort_assignment/features/home/controller/home_event.dart';

class DeepLinkServices {
  static final DeepLinkServices _instance = DeepLinkServices._();
  factory DeepLinkServices() => _instance;
  DeepLinkServices._();

  initialize() {
    final appLinks = AppLinks();
    appLinks.uriLinkStream.listen((uri) async {
      String deepLink = uri.path;
      Map<String, dynamic> queryParams =
          DataUtils.decodeQueryParams(uri.queryParameters);

      if (uri.toString().contains("http")) {
        deepLink = uri.toString();
        queryParams.clear();
      }

      consumeDeepLink(
        deepLink,
        queryParams,
      );
    });
  }

  Future<void> consumeDeepLink(
    String deepLink,
    Map<String, dynamic> args,
  ) async {
    await Future.doWhile(() async {
      if (AppConfig().homeContext != null) {
        return false;
      } else {
        await Future.delayed(const Duration(milliseconds: 500));

        return true;
      }
    });
    try {
      AppConfig().homeContext!.read<HomeBloc>().add(
            ConsumeDeepLink(
              deepLinkURL: deepLink,
              args: args.isNotEmpty ? args : null,
            ),
          );
    } catch (e) {
      e.toString().print;
    }
  }
}
