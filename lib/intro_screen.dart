import 'package:_03_islami/colors.dart';
import 'package:_03_islami/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<String> introImg = [
    'assets/images/intro/b1.png',
    'assets/images/intro/b2.png',
    'assets/images/intro/b3.png',
    'assets/images/intro/b4.png',
    'assets/images/intro/b5.png',
  ];

  List<String> topIntroText = [
    'Welcome To Islmi App',
    'Welcome To Islami',
    'Reading the Quran',
    'Bearish',
    'Holy Quran Radio',
  ];

  List<String> bottomIntroText = [
    '',
    'We Are Very Excited To Have You In Our Community',
    'Read, and your Lord is the Most Generous',
    'Praise the name of your Lord, the Most High',
    'You can listen to the Holy Quran Radio through the application for free easily',
  ];

  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.bgColor,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  index == 4 ? onLastPage = true : onLastPage = false;
                });
              },
              controller: _controller,
              itemCount: introImg.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(child: Image.asset('assets/images/top_logo.png')),
                    Container(
                      padding: EdgeInsets.only(bottom: 60),
                      height: 350,
                      child: Image.asset(introImg[index]),
                    ),
                    Text(
                      topIntroText[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsApp.mainGoldColor,
                        fontSize: 24,
                        fontFamily: 'Janna',
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      bottomIntroText[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsApp.mainGoldColor,
                        fontSize: 18,
                        fontFamily: 'Janna',
                      ),
                    ),
                  ],
                );
              },
            ),
            Container(
              alignment: Alignment(0, 0.9),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text(
                      'Back',
                      style: TextStyle(
                        color: ColorsApp.mainGoldColor,
                        fontFamily: 'janna',
                        fontSize: 16,
                      ),
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: introImg.length,
                    effect: WormEffect(
                      dotWidth: 7,
                      dotHeight: 7,
                      dotColor: Color(0xff707070),
                      activeDotColor: Color(0xffFFD482),
                    ),
                  ),

                  onLastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.homeRouteName,
                            );
                          },
                          child: Text(
                            'Finish',
                            style: TextStyle(
                              color: ColorsApp.mainGoldColor,
                              fontFamily: 'janna',
                              fontSize: 16,
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            _controller.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Text(
                            'Next',
                            style: TextStyle(
                              color: ColorsApp.mainGoldColor,
                              fontFamily: 'janna',
                              fontSize: 16,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
