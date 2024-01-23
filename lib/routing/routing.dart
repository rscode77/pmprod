import 'package:flutter/material.dart';
import 'package:pmprod/extensions/string_extension.dart';
import 'package:pmprod/pages/pages.dart';

class Routing {
  static const String _prefix = 'workPlan';
  static const String login = 'login';
  static const String partDetail = '$_prefix/partDetail';
  static const String partInProgress = '$_prefix/partInProgress';
  static const String workPlan = _prefix;
  
  const Routing._();

  static bool canHandleRoute(String? routeName, String prefix) => routeName?.startsWith('$prefix/') ?? false;

  static Route? getMainRoute(RouteSettings settings) {
    final String routeName = settings.name.orEmpty();

    final Widget child;
    // ignore: prefer_final_locals
    bool fullscreenDialog = false;
    final dynamic arguments = settings.arguments;

    switch (settings.name) {
      case workPlan:
        child = Pages.workPlan();
        break;
      case login:
        child = Pages.login();
        break;
      case partDetail:
        child = Pages.partDetail(arguments);
        break;
      case partInProgress:
        child = Pages.partInProgress();
        break;
      default:
        return null;
    }

    return Routing.buildRoute(settings, fullscreenDialog, child);
  }

  static Route buildRoute(
      RouteSettings settings,
      bool fullscreenDialog,
      Widget child,
      ) =>
      MaterialPageRoute(
        settings: settings,
        fullscreenDialog: fullscreenDialog,
        builder: (_) => child,
      );
}