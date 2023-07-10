import 'package:flutter/material.dart';
import 'package:lawfirmweb/pages/home.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Routes {
  static const String initial = "/";
  static const String demos = "/demos";
}

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return _GeneratePageRoute(
          widget: const Home(),
          routeName: settings.name,
        );

      default:
        return _GeneratePageRoute(
            widget: const Home(), routeName: settings.name);
    }
  }
}

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget? widget;
  final String? routeName;
  _GeneratePageRoute({this.widget, this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget ?? Container();
            },
            transitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return SlideTransition(
                  textDirection: TextDirection.rtl,
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: ResponsiveBreakpoints(
                    // ClampingScrollWrapper.builder(context, child),
                    // defaultScale: true,
                    breakpoints: const [
                      Breakpoint(start: 0, end: 800, name: MOBILE),
                      Breakpoint(start: 800, end: 1000, name: TABLET),
                      Breakpoint(start: 1000, end: 1200, name: TABLET),
                      Breakpoint(start: 1200, end: 2460, name: DESKTOP),
                      Breakpoint(start: 2460, end: 3200, name: "4K"),
                    ],
                    child: child,
                  ));
            });
}
