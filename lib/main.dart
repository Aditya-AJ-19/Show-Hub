import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:show_hub/core/domain/entity/media.dart';
import 'package:show_hub/core/resources/app_router.dart';
import 'package:show_hub/core/resources/app_theme.dart';
import 'package:show_hub/core/utils/hive_utils.dart';
import 'package:show_hub/features/watch%20List/presentation/bloc/watchlist_bloc.dart';
import 'package:show_hub/injection_container.dart';
// import 'package:show_hub/features/movie/presentation/pages/movie_page.dart';
// import 'package:show_hub/features/onboarding/onboarding_screen.dart';

void main() async {
  init();
  await Hive.initFlutter();
  Hive.registerAdapter(MediaAdapter());
  await HiveUtils.openAllBox();

  runApp(BlocProvider(
      create: (context) => getIt<WatchlistBloc>(),
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var isFirstTime = HiveUtils.readFirstTimeHiveBox();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp.router(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        routerConfig: AppRouter().router,
        // home: isFirstTime ? const OnboardingScreen() : const MovieScreen(),
      ),
    );
  }
}
