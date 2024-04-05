import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_hub/core/resources/app_routes.dart';
import 'package:show_hub/core/resources/app_text.dart';
import 'package:show_hub/core/utils/hive_utils.dart';
import 'package:show_hub/features/movie/presentation/pages/movie_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final onboardingContent = [
    {
      'image': 'assets/Images/Onboarding_1.jpg',
      'colors': [
        Colors.blue.withOpacity(0.1),
        Colors.indigo.withOpacity(0.2),
        Colors.indigo.withOpacity(0.45),
        Colors.indigo.withOpacity(0.95)
      ],
      'title': "Cinematic Explorer",
      'desc':
          "Dive into the world of movies and series with Cinematic Explorer!"
    },
    {
      'image': 'assets/Images/Onboarding_2.jpg',
      'colors': [
        Colors.blue.withOpacity(0.1),
        Colors.teal.withOpacity(0.2),
        Colors.teal.withOpacity(0.45),
        Colors.teal.withOpacity(0.98)
      ],
      'title': "Reel Insight Center",
      'desc':
          "Step into the Reel Insight Center - your ultimate guide to movies, series, and actors."
    },
    {
      'image': 'assets/Images/Onboarding_4.jpg',
      'colors': [
        Colors.red.withOpacity(0.1),
        Colors.redAccent.withOpacity(0.2),
        Colors.redAccent.withOpacity(0.5),
        Colors.redAccent.withOpacity(1)
      ],
      'title': "Series Safari",
      'desc':
          "Explore captivating series, discover gripping storylines, and dive into a world of endless episodic excitement with Series Safari."
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: onboardingContent.length,
        controller: _pageController,
        itemBuilder: (context, index) => OnboardingContent(
          image: onboardingContent[index]['image'].toString(),
          colors: onboardingContent[index]['colors'] as List<Color>,
          title: onboardingContent[index]['title'].toString(),
          desc: onboardingContent[index]['desc'].toString(),
          pageIndex: _pageIndex,
          onNextTap: () {
            if (_pageIndex == 2) {
              HiveUtils.writeInFirstTimeHiveBox();
              context.pushNamed(AppRoutes.mainPageRoute);
            } else {
              _pageController.nextPage(
                duration: const Duration(microseconds: 1200),
                curve: Curves.easeIn,
              );
            }
          },
        ),
        onPageChanged: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String image;
  final List<Color> colors;
  final String title;
  final String desc;
  final VoidCallback onNextTap;
  final int pageIndex;
  const OnboardingContent(
      {super.key,
      required this.image,
      required this.colors,
      required this.title,
      required this.desc,
      required this.onNextTap,
      required this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(image),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: const [
              0.0,
              0.2,
              0.4,
              0.6,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 4,
            ),
            Text(
              title.toUpperCase(),
              style: AppText.customeTextRoboto(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: size.width,
              height: 10.h,
            ),
            SizedBox(
              width: 300.w,
              child: Text(
                desc,
                style: AppText.customeTextRoboto(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            GestureDetector(
              onTap: onNextTap,
              child: Container(
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 2.sp),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  pageIndex == 2 ? 'Finish' : 'Next',
                  style: AppText.customeTextRoboto(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  3,
                  (index) => DotIndicator(isActive: index == pageIndex),
                ),
              ],
            ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  final bool isActive;
  const DotIndicator({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6.w),
      height: 10.h,
      width: isActive ? 20.h : 10.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
