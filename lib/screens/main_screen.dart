import 'package:auto_route/auto_route.dart';
import 'package:flutter_custom_tabs/main.gr.dart';
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
            foregroundColor: Colors.blue,
            backgroundColor: Colors.white,
            elevation: 0,
            shadowColor: Colors.transparent,
            title: Text(context.topRoute.name.replaceAll('Route', ''),
                style: const TextStyle(fontWeight: FontWeight.bold)),
            bottom: TabBar(
              labelColor: Colors.black38,
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.blue,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 4,
              indicator: const RoundedUnderlineDecoration(
                color: Colors.blue,
                borderRadius: 10,
              ),
              //indicator: const Decoration.boxPainter(),
              // The order of these tabs is aligned with the order in which they
              // appear in the routes property, defined above.
              tabs: const [
                Tab(
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'About',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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

//TODO: Custom Painters/Decoration (refactor this out later on)
class _RoundedUnderlinePainter extends BoxPainter {
  final Color color;
  final double strokeWidth;
  final double borderRadius;

  _RoundedUnderlinePainter({
    required this.color,
    this.strokeWidth = 2.0,
    this.borderRadius = 10.0,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = offset & configuration.size!;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double halfStrokeWidth = strokeWidth / 2.0;
    final double bottomY = rect.bottom; // Align to the bottom

    final Rect roundedRect = Rect.fromLTRB(
      rect.left + halfStrokeWidth,
      bottomY - strokeWidth, // Adjusted for alignment
      rect.right - halfStrokeWidth,
      bottomY,
    );

    final RRect rrect = RRect.fromRectAndRadius(
      roundedRect,
      Radius.circular(borderRadius),
    );

    canvas.drawRRect(rrect, paint);
  }
}

class RoundedUnderlineDecoration extends Decoration {
  final Color color;
  final double strokeWidth;
  final double borderRadius;

  const RoundedUnderlineDecoration({
    required this.color,
    this.strokeWidth = 2.0,
    this.borderRadius = 10.0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _RoundedUnderlinePainter(
      color: color,
      strokeWidth: strokeWidth,
      borderRadius: borderRadius,
    );
  }
}
