import 'package:auto_route/auto_route.dart';
import 'package:auto_route_app_scaffold/main.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [
        HomeRoute(), // screens/home_screen.dart
        ContactRoute(), // screens/contact_screen.dart
        AboutRoute(), // screens/about_screen.dart
      ],
      builder: (context, child, tabController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.topRoute.name.replaceAll('Route', ''),
            ),
            bottom: TabBar(
              controller: tabController,
              // The order of these tabs is aligned with the order in which they
              // appear in the routes property, defined above.
              tabs: const [
                Tab(
                  icon: Icon(Icons.home),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(Icons.contact_page),
                  text: 'Contact',
                ),
                Tab(
                  icon: Icon(Icons.info),
                  text: 'About',
                ),
              ],
            ),
          ),
          // This is the content of the current selected route, and can be found
          // in screens/home_screen.dart, screens/contact_screen.dart, etc.
          body: child,
        );
      },
    );
  }
}
