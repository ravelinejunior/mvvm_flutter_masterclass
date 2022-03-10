import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_flutter_masterclass/data/model/slider_model.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/strings_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/theme_manager.dart';
import 'package:mvvm_flutter_masterclass/presentation/managers/values_manager.dart';

class BoardingComponent extends StatelessWidget {
  final SliderModel _slider;
  const BoardingComponent(this._slider, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppFontSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppFontSize.s8),
          child: Text(
            _slider.title,
            style: getApplicationTheme().textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppFontSize.s8),
          child: Text(
            _slider.subTitle,
            style: getApplicationTheme().textTheme.subtitle1,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: AppFontSize.s60,
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: AppFontSize.s8,
          clipBehavior: Clip.antiAlias,
          child: SvgPicture.asset(
            _slider.image,
            semanticsLabel: _slider.subTitle,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
