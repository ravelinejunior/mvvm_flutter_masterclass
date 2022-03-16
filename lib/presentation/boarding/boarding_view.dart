import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/presentation/boarding/boarding_view_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/boarding/components/boarding_component_view.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/color_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';

class BoardingView extends StatefulWidget {
  const BoardingView({Key? key}) : super(key: key);

  @override
  State<BoardingView> createState() => _BoardingViewState();
}

class _BoardingViewState extends State<BoardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardViewModel _boardingViewModel = OnBoardViewModel();

  _bind() {
    _boardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
        initialData: null,
        stream: _boardingViewModel.outputSliderViewObject.asBroadcastStream(),
        builder: (context, snapshot) {
          return _getContentWidget(snapshot.data);
        });
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('OnBoarding'),
          elevation: AppFontSize.s1_5,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numOfSlides,
          itemBuilder: (context, index) {
            final slider = sliderViewObject.sliderModel;
            return BoardingComponent(slider);
          },
          onPageChanged: (index) {
            setState(() {
              _boardingViewModel.onPageChanged(index);
            });
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          height: AppFontSize.s100,
          child: Column(children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(primary: ColorManager.primary),
                onPressed: () {
                  _pageController.animateToPage(
                    sliderViewObject.numOfSlides - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceIn,
                  );
                },
                child: Text(
                  AppStrings.skipString,
                  style: GoogleFonts.lato(
                    color: ColorManager.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getBottomSheet(sliderViewObject),
            )
          ]),
        ),
      );
    } else {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator.adaptive()),
      );
    }
  }

  Widget _getBottomSheet(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              splashColor: Colors.amber[200],
              onTap: () {
                _pageController.animateToPage(
                  _boardingViewModel.goPreviousPage(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
              child: SizedBox(
                height: AppFontSize.s20,
                width: AppFontSize.s20,
                child: SvgPicture.asset('assets/images/left_arrow_ic.svg'),
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: _getProperCircle(i, sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              splashColor: Colors.amber[200],
              onTap: () {
                _pageController.animateToPage(
                  _boardingViewModel.goNextPage(),
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.bounceIn,
                );
              },
              child: SizedBox(
                height: AppFontSize.s20,
                width: AppFontSize.s20,
                child: SvgPicture.asset('assets/images/right_arrow_ic.svg'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index, int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset('assets/images/hollow_circle_ic.svg');
    } else {
      return SvgPicture.asset('assets/images/solid_circle_ic.svg');
    }
  }

  @override
  void dispose() {
    _boardingViewModel.dispose();
    super.dispose();
  }
}
