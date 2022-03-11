import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/data/model/slider_model.dart';
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
  late final List<SliderModel> _sliders = SliderModel.getSlidersModel();

  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
        itemCount: _sliders.length,
        itemBuilder: (context, index) {
          final slider = _sliders[index];
          return BoardingComponent(slider);
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
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
                  _sliders.length - 1,
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
            child: _getBottomSheet(),
          )
        ]),
      ),
    );
  }

  Widget _getBottomSheet() {
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
                  _getPreviousIndex(),
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
              for (int i = 0; i < _sliders.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: _getProperCircle(i),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: InkWell(
              splashColor: Colors.amber[200],
              onTap: () {
                _pageController.animateToPage(
                  _getNextIndex(),
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

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset('assets/images/hollow_circle_ic.svg');
    } else {
      return SvgPicture.asset('assets/images/solid_circle_ic.svg');
    }
  }

  int _getPreviousIndex() {
    int previusIndex = _currentIndex--;
    if (previusIndex == -1) {
      _currentIndex = _sliders.length - 1;
    }

    return _currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _sliders.length) {
      _currentIndex = 0;
    }

    return _currentIndex;
  }
}
