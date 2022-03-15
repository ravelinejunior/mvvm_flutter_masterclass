import 'dart:async';

import 'package:mvvm_flutter_masterclass/domain/slider_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';

class OnBoardViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();

  late final List<SliderModel> _sliders;
  int _currentIndex = 0;

//call this method everytime that something changes
  _postDataToView() {
    //put the data inside the pipe
    inputSliderViewObject.add(
      SliderViewObject(
          sliderModel: _sliders[_currentIndex],
          numOfSlides: _sliders.length,
          currentIndex: _currentIndex),
    );
  }

  // From base view model
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliders = SliderModel.getSlidersModel();
    //send the slider to view

    _postDataToView();
  }

  // from input and out put

  @override
  void goNextPage() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _sliders.length) {
      _currentIndex = 0;
    }

    _postDataToView();
  }

  @override
  void goPreviousPage() {
    int previusIndex = _currentIndex--;
    if (previusIndex == -1) {
      _currentIndex = _sliders.length - 1;
    }

    _postDataToView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => _streamController.sink;
  @override
  // TODO: implement outputSliderViewObject
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
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
