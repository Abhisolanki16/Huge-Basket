import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:march_27/constants.dart';
import 'package:march_27/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int currentINndex = 0;
  List<Image> imageList = [
    Assets.tutorial1.image(),
    Assets.tutorial3.image(),
    Assets.tutorial4.image(),
  ];

  List<String> descriptionList = [
    'Loren ipsum is simply dummy text of the printing and typesetting industry.',
    'Loren ipsum is simply dummy text of the printing and typesetting industry.',
    'Loren ipsum is simply dummy text of the printing and typesetting industry.',
  ];

  late PageController controller = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    controller = PageController();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: AppColors.originalWhite,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
                top: 20.h,
                right: 20.w,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.pushNamed(context, '/mobile');
                    });
                  },
                  child: Text(
                    (currentINndex == imageList.length - 1) ? ' ' : "Skip",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                )),
            PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Column(children: [
                  SizedBox(
                    height: 130.h,
                  ),
                  Image(image: imageList[index].image),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: Text(
                      AppLocalizations.of(context)!.title1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                    child: const Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      "Loren ipsum is simply dummy text of the printing and typesetting industry.",
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  ),
                  const Spacer(),
                ]);
              },
              controller: controller,
              itemCount: 3,
              onPageChanged: (index) {
                setState(() {
                  //controller.jumpToPage(index);
                  currentINndex = index;
                });
                //
              },
            ),
            Positioned(
              bottom: 50.h,
              left: 30.w,
              child: SmoothPageIndicator(
                  onDotClicked: (index) {
                    setState(() {
                      controller.jumpToPage(index);
                      currentINndex = index;
                    });
                  },
                  controller: controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Color(
                        0xFF44B12C,
                      ),
                      dotHeight: 10,
                      dotWidth: 12)),
            ),
            Positioned(
              bottom: 40.h,
              right: 30.w,
              child: ElevatedButton(
                onPressed: () {
                  if (currentINndex == imageList.length - 1) {
                    // Navigator.pushNamed(context, '/mobile');

                    Navigator.pushReplacementNamed(context, '/mobile');
                  } else {
                    controller.nextPage(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        curve: Curves.easeInOut);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                    backgroundColor: const Color(0xFF44B12C)),
                child: Text(
                  currentINndex == imageList.length - 1 ? "Go" : "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
