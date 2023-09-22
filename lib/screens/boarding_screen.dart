import 'package:flutter/material.dart';
import '../components/button_component.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ani_mall/data/list_data.dart';
import 'package:ani_mall/screens/login_screen.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/screens/create_account_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String id = 'boarding_screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int indicator = 0;
  int publicIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundGreenColor,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                  // color: Color(0xff2DB190),
                  ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 90.0,
                      height: 5.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 14.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        color: (indicator == entry.key
                                ? kYellowButtonColor
                                : Colors.white)
                            .withOpacity(indicator == entry.key ? 0.9 : 0.9),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: CarouselSlider.builder(
              itemCount: imgList.length,
              itemBuilder: (ctx, index, realIdx) {
                return Column(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imgList[index]),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: kBackgroundGreenColor,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                              left: 40.0, right: 40.0, top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                titleList[index],
                                style: const TextStyle(
                                    fontFamily: 'Mermaid',
                                    fontSize: 28.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                messageList[index],
                                style: const TextStyle(
                                  fontFamily: 'Inria Sans',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              options: CarouselOptions(
                height: double.infinity,
                autoPlay: true,
                viewportFraction: 1.0,
                autoPlayCurve: Curves.easeInOut,
                onPageChanged: (index, reason) {
                  setState(() {
                    indicator = index;
                  });
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              // decoration: BoxDecoration(color: const Color(0xff248E73)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  children: [
                    ButtonsWidget(
                      onPress: () {
                        //TODO carry out complex auth logic
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      color: kGreenButtonColor,
                      text: 'Log in',
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ButtonsWidget(
                      onPress: () {
                        //TODO carry out registration logic
                        Navigator.pushNamed(context, CreateAccountScreen.id);
                      },
                      color: kYellowButtonColor,
                      text: 'Create account',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
