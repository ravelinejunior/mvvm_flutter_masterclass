import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_flutter_masterclass/data/model/slider_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/color_manager.dart';
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
          return Center(
            child: Text(
              slider.title,
              style: GoogleFonts.montserrat(
                fontSize: 24.0,
              ),
            ),
          );
        },
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            debugPrint("Current Index = $_currentIndex");
          });
        },
      ),
    );
  }
}
