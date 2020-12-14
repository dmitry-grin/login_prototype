import 'package:flutter/material.dart';
import 'package:login_prototype/src/auth_handler.dart';
import 'package:login_prototype/src/login_screen.dart';
import 'package:login_prototype/src/main_screen.dart';
import 'package:login_prototype/src/navigator2.0/cx_route_path.dart';
import 'package:provider/provider.dart';

class CXRouterDelegate extends RouterDelegate<CXRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CXRoutePath> {

  final GlobalKey<NavigatorState> navigatorKey;
  CXRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthHandler>(
      builder: (context, value, child) {
        return Navigator(
          key: navigatorKey,
          pages: [
            if (value.isLogined)
              MaterialPage(child: LoginScreen())
            else
              MaterialPage(child: MainScreen())
          ],
          onPopPage: (route, result) {
            return true;
          },
        );
      },
    );
  }

  @override
  Future<void> setNewRoutePath(CXRoutePath configuration) async {
    return;
  }
}
