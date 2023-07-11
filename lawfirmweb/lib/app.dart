import 'package:flutter/material.dart';

import 'package:responsive_framework/responsive_framework.dart';

import 'pages/home.dart';
import 'utils/constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lawyer',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.yellow,
      ),
      builder: (context, widget) => ResponsiveBreakpoints(
        // ClampingScrollWrapper.builder(context, child),
        // defaultScale: true,
        breakpoints: const [
          Breakpoint(start: 0, end: 800, name: MOBILE),
          Breakpoint(start: 800, end: 1000, name: TABLET),
          Breakpoint(start: 1000, end: 1200, name: TABLET),
          Breakpoint(start: 1200, end: 2460, name: DESKTOP),
          Breakpoint(start: 2460, end: 3200, name: "4K"),
        ],
        child: widget ?? Container(),
      ),
      home: const Home(),
    );
  }
}
