import 'dart:async';

import 'package:mvvm_flutter_masterclass/data/model/slider_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';

class OnBoardViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  // From base view model
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  // from input and out put

  @override
  void goNextPage() {
    // TODO: implement goNextPage
  }

  @override
  void goPreviousPage() {
    // TODO: implement goPreviousPage
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();

  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      throw UnimplementedError();
}

abstract class OnBoardingViewModelInputs {
  void goNextPage();
  void goPreviousPage();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderModel sliderModel;
  int numOfSlides;
  int currentIndex;

  SliderViewObject({
    required this.sliderModel,
    required this.numOfSlides,
    required this.currentIndex,
  });

  SliderViewObject copyWith({
    SliderModel? sliderModel,
    int? numOfSlides,
    int? currentIndex,
  }) {
    return SliderViewObject(
      sliderModel: sliderModel ?? this.sliderModel,
      numOfSlides: numOfSlides ?? this.numOfSlides,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
