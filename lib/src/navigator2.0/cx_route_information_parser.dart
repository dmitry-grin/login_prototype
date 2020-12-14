import 'package:flutter/material.dart';
import 'cx_route_path.dart';

class CXRouteInformationParser extends RouteInformationParser<CXRoutePath> {
  @override
  Future<CXRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    print('🚵 Route is ' + routeInformation.location);
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.isNotEmpty &&
        uri.pathSegments[0] == UrlFirstSection.home().name) {
      return CXRoutePath.home();
    }

    return CXRoutePath.login();
  }
}
