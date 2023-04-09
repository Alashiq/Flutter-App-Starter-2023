import 'package:flutter/material.dart';
import 'package:flutter_app_starter/Features/Auth/auth_controller.dart';
import 'package:flutter_app_starter/UI/onboarding_screen.dart/widgets/onboard_slide.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../Features/MainController/main_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardKey = GlobalKey<IntroductionScreenState>();

    return Scaffold(
        body: GetBuilder<AuthController>(
      builder: (controller) => Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: IntroductionScreen(
            // globalBackgroundColor: Color(0xffeff1f7),
            globalBackgroundColor: Color(0xffeff1f7),
            key: onboardKey,
            onChange: (value) {
              controller.onboarding = value;
              controller.update();
              print(value);
            },
            bodyPadding: EdgeInsets.fromLTRB(0, 140, 0, 0),
            globalHeader: Container(
              height: 50,
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.fromLTRB(10, 60, 10, 10),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 80,
                    ),
                    Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/img/logo.png",
                        height: 42,
                      ),
                    )),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      child: controller.onboarding != 2
                          ? InkWell(
                              onTap: () {
                                Get.offNamed("/login");
                              },
                              child: Text(
                                "تخطي",
                                style: TextStyle(
                                  fontFamily: 'Adelle',
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5a5a5a),
                                  fontSize: 14,
                                ),
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
            globalFooter: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 46),
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  if (controller.onboarding != 2)
                    onboardKey.currentState
                        ?.animateScroll(controller.onboarding + 1);
                  else
                    controller.endBoarding();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff244571),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                child: Text(
                  controller.onboarding != 2 ? "التالي" : "إبدأ الأن",
                  style: const TextStyle(
                    fontFamily: 'Adelle',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            pages: [
              onBoardSlide(
                "فرص تبرع متنوعة",
                "نغطي كافة المجالات الخيرية وتصل الى من يستحقها من الفئات الاشد احتياجا",
                'https://www.peppyocean.com/wp-content/uploads/2020/06/grocery-package.png',
                false,
              ),
              onBoardSlide(
                "طرق دفع امنة وسهلة",
                "عبر خيارات متعددة تسهل عملية التبرع والعطاء.",
                'https://appdukaan.com/wp-content/uploads/2021/09/Group-192589.png',
                false,
              ),
              onBoardSlide(
                "فرص تبرع متنوعة",
                "نغطي كافة المجالات الخيرية وتصل الى من يستحقها من الفئات الاشد احتياجا",
                'assets/svg/onboard2.svg',
                true,
              ),
            ],
            showNextButton: false,
            showDoneButton: false,
            dotsDecorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(20.0, 9.0),
              activeColor: Color(0xff1c8e76),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
            ),
          ),
        ),
      ),
    ));
  }
}
