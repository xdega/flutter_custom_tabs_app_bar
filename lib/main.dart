import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:auto_route_app_scaffold/main.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          // This is the initial route displayed when the app is started. It is
          // the top level below which all other app routes are nested.
          // Additional top level routes could be used for special pages, like
          // a login/register page that doesn't need to contain the main nested
          // app routes.
          page: MainRoute.page,
          initial: true,
          // These are the child routes nested under the MainRoute. They are the
          // tabs displayed in the app bar.
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
            AutoRoute(
              page: AboutRoute.page,
              path: 'about',
            ),
            AutoRoute(
              page: ContactRoute.page,
              path: 'contact',
            ),
            // To add a new route here, create a new file in screens/* and name
            // it appropriately (e.g. new_screen.dart). Then run the generator
            // command: `flutter packages pub run build_runner build`. After
            // that is done, you can add it here as a child of MainRoute.
            // The page property should be the name of the route's class, with
            // Screen replaced by Route.
          ],
        ),
      ];
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
