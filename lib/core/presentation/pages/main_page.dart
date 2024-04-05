import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:show_hub/core/resources/app_router.dart';
import 'package:show_hub/core/resources/app_routes.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final String location = GoRouterState.of(context).fullPath!;
          if (!location.startsWith(moviesPath)) {
            _onItemTapped(0, context);
          }
          return true;
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: 'Movies',
            icon: Icon(
              Icons.movie_creation_rounded,
              size: 20.sp,
            ),
          ),
          // BottomNavigationBarItem(
          //   label: 'Shows',
          //   icon: Icon(
          //     Icons.tv_rounded,
          //     size: 20.sp,
          //   ),
          // ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Icon(
              Icons.search_rounded,
              size: 20.sp,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Watchlist',
            icon: Icon(
              Icons.bookmark_rounded,
              size: 20.sp,
            ),
          ),
        ],
        currentIndex: _getSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).fullPath!;
    if (location.startsWith(moviesPath)) {
      return 0;
    }
    // if (location.startsWith(tvShowsPath)) {
    //   return 1;
    // }
    if (location.startsWith(searchPath)) {
      return 1;
    }
    if (location.startsWith(watchlistPath)) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.goNamed(AppRoutes.moviesRoute);
        break;
      // case 1:
      //   context.goNamed(AppRoutes.tvShowsRoute);
      //   break;
      case 1:
        context.goNamed(AppRoutes.searchRoute);
        break;
      case 2:
        context.goNamed(AppRoutes.watchlistRoute);
        break;
    }
  }
}