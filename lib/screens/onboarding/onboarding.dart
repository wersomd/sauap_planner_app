import 'package:flutter/material.dart';
import 'package:sauap_planner/routes/pages.dart';
import 'package:sauap_planner/screens/onboarding/model/onboarding.model.dart';

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
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: Color(0xFF000000),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 4,
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
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            image: DecorationImage(
                              image: AssetImage(
                                onboardingContents[i].image,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: (size.height >= 840) ? 40 : 20,
                        ),
                        Text(
                          onboardingContents[i].title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "JetBrains Mono",
                            fontWeight: FontWeight.w600,
                            fontSize: (size.width <= 550) ? 30 : 35,
                          ),
                        ),
                        SizedBox(
                          height: (size.height >= 840) ? 40 : 20,
                        ),
                        Text(
                          onboardingContents[i].subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "JetBrains Mono",
                            fontWeight: FontWeight.w600,
                            fontSize: (size.width <= 550) ? 24 : 28,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingContents.length,
                      (int index) => _buildDots(
                        index: index,
                      ),
                    ),
                  ),
                  _currentPage + 1 == onboardingContents.length
                      ? Padding(
                          padding: const EdgeInsets.all(30),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Pages.wrapper);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                              padding: (size.width <= 550)
                                  ? const EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 20)
                                  : EdgeInsets.symmetric(
                                      horizontal: size.width * 0.2,
                                      vertical: 25),
                              textStyle: TextStyle(
                                  fontSize: (size.width <= 550) ? 13 : 17),
                            ),
                            child: Text(
                              "Бастау".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                letterSpacing: 1.3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _controller.jumpToPage(2);
                                },
                                style: TextButton.styleFrom(
                                  elevation: 0,
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: (size.width <= 550) ? 13 : 17,
                                  ),
                                ),
                                child: Text(
                                  "Өткізу".toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.easeIn,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  elevation: 0,
                                  padding: (size.width <= 550)
                                      ? const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 20,
                                        )
                                      : const EdgeInsets.symmetric(
                                          horizontal: 30,
                                          vertical: 25,
                                        ),
                                  textStyle: TextStyle(
                                    fontSize: (size.width <= 550) ? 13 : 17,
                                  ),
                                ),
                                child: Text(
                                  "Келесі".toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.32,
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
