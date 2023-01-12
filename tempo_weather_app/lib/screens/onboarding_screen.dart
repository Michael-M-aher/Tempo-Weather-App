import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:lottie/lottie.dart';
import '../config/colors.dart';
import '../config/strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Choose Location',
      skipIcon: const Icon(
        size: 26,
        Icons.arrow_forward_outlined,
        color: AppColors.myDark,
      ),
      finishButtonTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.myDark,
      ),
      onFinish: () {
        Navigator.pushNamedAndRemoveUntil(context, mapScreen, (route) => false);
      },
      finishButtonColor: AppColors.myWhite,
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 18,
          color: AppColors.myWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: AppColors.myWhite,
      totalPage: 3,
      headerBackgroundColor: AppColors.myDark,
      pageBackgroundColor: AppColors.myDark,
      background: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: Lottie.network(
            'https://assets3.lottiefiles.com/packages/lf20_kljxfos1.json',
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_cHA3rG.json',
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 400,
          child: Lottie.network(
            'https://lottie.host/5476d082-e81e-49ff-aaa5-3b311dffd790/QzC9Twvtrs.json',
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'On your way...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'searching for app to get accurate wether data',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'You’ve reached your destination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'with simple, beautiful ui you can find weather forecast for 14 days',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Pick up your location to get the weather data of your area.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
