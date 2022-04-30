import 'package:flutter/material.dart';
import 'package:camwater/models/onboarding_info.dart';
import 'package:get/state_manager.dart';
import 'package:get/utils.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  var pageController = PageController();

  forwardAction() {
    if (isLastPage) {
    } else
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
  }
  List<OnboardingInfo> onboardingPages = [
    new OnboardingInfo(image: "assets/images/production.jpg", title: "Production", description: "Now you can order food any time  right from your mobile."),
    new OnboardingInfo(image: "assets/images/commercial.jpg", title: "Commercialisation", description: "Now you can order food any time  right from your mobile."),
    new OnboardingInfo(image: "assets/images/assainissement.jpg", title: "Assainissement", description: "Now you can order food any time  right from your mobile."),
    new OnboardingInfo(image: "assets/images/distribution.jpg", title: "Distribution", description: "Now you can order food any time  right from your mobile."),
  ];
}