import 'dart:async';

import 'package:mvvm_flutter_masterclass/domain/slider_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/base/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class OnBoardViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //Stream controllers
  final BehaviorSubject _streamController = BehaviorSubject<SliderViewObject>();

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
  int goNextPage() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _sliders.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  @override
  int goPreviousPage() {
    int previusIndex = _currentIndex--;
    if (previusIndex == -1) {
      _currentIndex = _sliders.length - 1;
    }
    return _currentIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);
}

abstract class OnBoardingViewModelInputs {
  int goNextPage();
  int goPreviousPage();
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
}
