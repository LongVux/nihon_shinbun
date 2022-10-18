import 'package:flutter/material.dart';
import 'package:nihon_shinbun/constants/string.dart';

Route onGenerateRoute(Map<String, Widget> nestedRouteMap,
    RouteSettings settings, String defaultRoute) {
  return MaterialPageRoute<dynamic>(
      builder: (context) => (nestedRouteMap[settings.name] != null)
          ? nestedRouteMap[settings.name]!
          : nestedRouteMap[defaultRoute]!,
      settings: settings);
}
