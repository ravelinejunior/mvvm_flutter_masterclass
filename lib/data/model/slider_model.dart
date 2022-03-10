import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';

class SliderModel {
  String title;
  String subTitle;
  String image;
  SliderModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

  static List<SliderModel> getSlidersModel() => [
        SliderModel(
            title: AppStrings.onBoardingTitle1,
            subTitle: AppStrings.onBoardingSubTitle1,
            image: "assests/images/onboarding_logo1.svg"),
        SliderModel(
            title: AppStrings.onBoardingTitle2,
            subTitle: AppStrings.onBoardingSubTitle2,
            image: "assests/images/onboarding_logo2.svg"),
        SliderModel(
            title: AppStrings.onBoardingTitle3,
            subTitle: AppStrings.onBoardingSubTitle3,
            image: "assests/images/onboarding_logo3.svg"),
        SliderModel(
            title: AppStrings.onBoardingTitle4,
            subTitle: AppStrings.onBoardingSubTitle4,
            image: "assests/images/onboarding_logo4.svg"),
      ];

  @override
  String toString() =>
      'SliderModel(title: $title, subTitle: $subTitle, image: $image)';
}
