import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/models/init_entity.dart';
import 'package:clean_air/services/objectbox_service.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/widgets/onboarding/onboarding_page_model.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

const _rawPages = [
  OnboardingPageModel(
    title: 'Clean Air',
    body: 'on demand with location AQI and health based tracking advices.',
    asset: kOnboardingAsset1,
  ),
  OnboardingPageModel(
    title: 'Saved Locations',
    body: 'for your easy monitoring of AQI changes in preferred locations.',
    asset: kOnboardingAsset2,
  ),
  OnboardingPageModel(
    title: 'Save the Earth',
    body: 'and improve the quality of your life and health with CleanAir.',
    asset: kOnboardingAsset3,
  ),
];

final _introKey = GlobalKey<IntroductionScreenState>();

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _objectBoxService = locator<ObjectBoxService>();

  GlobalKey<IntroductionScreenState> get key => _introKey;

  List<OnboardingPageModel> get pages => _rawPages;

  void onDone() {
    const object = InitEntity(id: 1, isInitialStartUp: 1);
    _objectBoxService.put<InitEntity>(object);
    _navigationService.replaceWithLoginView();
  }
}
