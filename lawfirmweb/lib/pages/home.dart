import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../providers/home.dart';
import '../providers/theme.dart';
import '../utils/globals.dart';
import '../utils/screen_helper.dart';
import '../widgets/header.dart';
import '../widgets/switch.dart';

class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home>
    with SingleTickerProviderStateMixin {
  late HomeProvider _homeProvider;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    _homeProvider = ref.read(homeProvider);
    super.initState();
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context)
              .copyWith(scrollbars: false, platform: TargetPlatform.android),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context) ? 30 : 20,
                ),
                // Carousel(
                //   key: _homeProvider.homeKey,
                // ),
                // const SizedBox(
                //   height: 20.0,
                // ),
                // AboutSection(
                //   key: _homeProvider.aboutKey,
                // ),
                // ServiceSection(
                //   key: _homeProvider.bookConsKey,
                // ),
                SizedBox(
                  key: _homeProvider.blogsKey,
                  height: 100.0,
                ),
                Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Blogs",
                      style: GoogleFonts.josefinSans(
                        fontWeight: FontWeight.w900,
                        fontSize: 36,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Here are some of News",
                      style: GoogleFonts.josefinSans(
                        color: Colors.grey[500],
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    )
                  ],
                )),
                // BlogsSection(
                //   blogs: BlogsModel.blogs,
                // ),
                // const Padding(
                //   padding: EdgeInsets.symmetric(vertical: 28.0),
                //   child: BlogsStats(),
                // ),
                const SizedBox(
                  height: 20.0,
                ),
                // Footer(
                //   key: _homeProvider.contactKey,
                // )
              ],
            ),
          ),
        ),
        Header(
          themeSwitch: ThemeSwitcher(
              clipper: const ThemeSwitcherBoxClipper(),
              builder: (context) {
                return CustomSwitch(
                  value: ref.watch(themeProvider).isDarkMode,
                  onChanged: (val) {
                    ref.read(themeProvider).changeTheme(val);
                    ThemeSwitcher.of(context).changeTheme(
                        theme: ref.read(themeProvider).getCurrentTheme,
                        isReversed: false // default: false
                        );
                  },
                );
              }),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: Scaffold(
        key: Globals.scaffoldKey,
        endDrawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      if (Globals.scaffoldKey.currentState != null) {
                        if (Globals.scaffoldKey.currentState!.isEndDrawerOpen) {
                          Navigator.pop(context);
                          _homeProvider.scrollBasedOnHeader(
                              HeaderRow.headerItems[index]);
                        }
                      }
                    },
                    leading: Icon(
                      HeaderRow.headerItems[index].iconData,
                    ),
                    title: Text(
                      HeaderRow.headerItems[index].title,
                      style: const TextStyle(),
                    ),
                    trailing: HeaderRow.headerItems[index].isDarkTheme != null
                        ? HeaderRow.headerItems[index].isDarkTheme!
                            ? SizedBox(
                                width: 50,
                                child: CustomSwitch(
                                  value: ref.watch(themeProvider).isDarkMode,
                                  onChanged: (val) {
                                    ref.read(themeProvider).changeTheme(val);
                                    // ThemeSwitcher.of(context).changeTheme(
                                    //     theme: ref
                                    //         .read(themeProvider)
                                    //         .getCurrentTheme,
                                    //     isReversed: false // default: false
                                    //     );
                                  },
                                ),
                              )
                            : null
                        : null,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10.0,
                  );
                },
                itemCount: HeaderRow.headerItems.length,
              ),
            ),
          ),
        ),
        body: _buildPage(),
      ),
    );
  }
}
