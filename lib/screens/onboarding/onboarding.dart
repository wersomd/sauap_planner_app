import 'package:flutter/material.dart';
import 'package:sauap_planner/components/custom_button.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/screens/onboarding/model/onboarding.model.dart';
import 'package:sauap_planner/utils/color_palette.dart';
import 'package:sauap_planner/utils/font_sizes.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({
    required int index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        border: const Border.fromBorderSide(
          BorderSide(
            color: kSecondColor,
          ),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        color: _currentPage == index ? kSecondColor : kTransparentColor,
      ),
      margin: const EdgeInsets.only(right: 5),
      width: 12,
      height: 12,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width <= 550;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: onboardingContents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      bottom: 30.0,
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: AssetImage(
                                onboardingContents[i].image,
                              ),
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingContents.length,
                            (int index) => _buildDots(
                              index: index,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          onboardingContents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: isSmallScreen ? 30 : 35,
                            color: kDarkPurple,
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          onboardingContents[i].subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: isSmallScreen ? 18 : 20,
                            color: kDarkPurple.withOpacity(.6),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentPage + 1 == onboardingContents.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: CustomButton(
                            width: size.width * 0.8,
                            height: 55,
                            borderRadius: BorderRadius.circular(24),
                            onPressed: () {
                              Navigator.pushNamed(context, Pages.wrapper);
                            },
                            child: const Text(
                              "Бастау",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                letterSpacing: .8,
                              ),
                            ),
                          ))
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                width: size.width * 0.8,
                                height: 55,
                                borderRadius: BorderRadius.circular(24),
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                child: const Text(
                                  "Келесі",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: .8,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isSmallScreen ? 13 : 17,
                                  ),
                                ),
                                child: Text(
                                  "Өткізу".toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: textMedium,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ],
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
