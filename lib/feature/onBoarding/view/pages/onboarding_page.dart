import 'package:flutter/material.dart';
import 'package:majeat_driver/core/shared/widgets/blured_container.dart';
import 'package:majeat_driver/feature/login/view/login_page.dart';
import 'package:majeat_driver/feature/onBoarding/view/widgets/Indecatror.dart';
import 'package:majeat_driver/feature/onBoarding/view/widgets/center_content.dart';

import '../../../../core/constants/app_constant.dart';


class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  int currentIndex = 0;

  nextFunction() {
    _pageController.nextPage(
        duration: OnboardingPage._kDuration, curve: OnboardingPage._kCurve);
  }

  previousFunction() {
    _pageController.previousPage(
        duration: OnboardingPage._kDuration, curve: OnboardingPage._kCurve);
  }

  onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: onChangedFunction,
            children: <Widget>[
              Container(
                child: center_content(
                  iconData: Icons.book,
                  description:
                      'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                  image_url:
                      'https://images.pexels.com/photos/20655113/pexels-photo-20655113/free-photo-of-men-standing-by-a-food-stand-in-the-evening.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  title: 'Order for Food',
                ),
              ),
              Container(
                child: center_content(
                    iconData: Icons.delivery_dining,
                    description:
                        'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                    image_url:
                        'https://images.pexels.com/photos/17391588/pexels-photo-17391588/free-photo-of-woman-eating-fish-in-restaurant.jpeg?auto=compress&cs=tinysrgb&w=300',
                    title: 'Delivery for Food'),
              ),
              Container(
                child: center_content(
                  iconData: Icons.payment,
                  description:
                      'Lorem ipsum dolor sit amet, conse ctetur  adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.',
                  image_url:
                      'https://media.istockphoto.com/id/1363074251/photo/vegetarian-injera-meal-with-shiro-lentils-and-egg.jpg?b=1&s=612x612&w=0&k=20&c=1x7l5GkUyep01ADHxiQxQtLhLqxtF3plRCR0wm_JNjU=',
                  title: 'Order for Food',
                  child: BlurredContainer(
                    margin: const EdgeInsets.only(top: 20),
                    child: InkWell(
                      onTap: () {
                        //here we add that the prefrence to tag the user as a first time user and onboarding is completed
                        
                        //check for the prefence if the user is new or old

                        //here it check if the user have signed in before or new appilication installed
                          if(false){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Loginpage(),
                              ),
                            );
                          }else{
                        //if the user is new it will navigate to the signup page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginpage(),
                          ),
                        );     
                          }
                       
                        //if the user is old it will navigate to the signin page
                      },
                      child: const Text(
                        'TRY ORDERING 🍕',
                        style: AppConstant.continue_center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 60,
            left: 200,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Indicator(
                  positionIndex: 0,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 1,
                  currentIndex: currentIndex,
                ),
                const SizedBox(
                  width: 10,
                ),
                Indicator(
                  positionIndex: 2,
                  currentIndex: currentIndex,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () => previousFunction(),
                        child: const Text(
                          "⏮️ Previous",
                          style: TextStyle(color: Colors.blue),
                        )),
                    const SizedBox(
                      width: 200,
                    ),
                    InkWell(
                        onTap: () => nextFunction(),
                        child: const Text(
                          "Next ⏭️",
                          style: TextStyle(color: Colors.blue),
                        )),
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
