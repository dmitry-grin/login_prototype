import 'package:flutter/material.dart';
import 'package:login_prototype/src/auth_handler.dart';
import 'package:login_prototype/src/navigator2.0/cx_route_information_parser.dart';
import 'package:login_prototype/src/navigator2.0/cx_router_delegate.dart';
import 'package:provider/provider.dart';
import 'package:login_prototype/src/theme.dart';
import 'package:login_prototype/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  CXRouterDelegate _routerDelegate = CXRouterDelegate();
  CXRouteInformationParser _informationParser = CXRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthHandler(),
      child: MaterialApp.router(
        routerDelegate: _routerDelegate,
        routeInformationParser: _informationParser,
        theme: lightTheme,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
      ),
    );
  }

  // Route routes(RouteSettings settings) {
  //   if (settings.name == '/main') {
  //     return MaterialPageRoute(builder: (_) => MainScreen());
  //   } else {
  //     return MaterialPageRoute(builder: (_) {
  //       return Provider<LoginBloc>(
  //         create: (_) => LoginBloc(),
  //         dispose: (_, bloc) => bloc.dispose(),
  //         lazy: true, // create the bloc only when asked for the first time.
  //         child: Builder(
  //           // using builder to access context after the provider
  //           builder: (builderContext) {
  //             final bloc = Provider.of<LoginBloc>(builderContext);

  //             return LoginScreen();
  //           },
  //         ),
  //       );
  //     });
  //   }
  // }
}
