
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';

class LogosBar extends StatelessWidget {
  const LogosBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          'assets/vectors/Component 8.svg',
          height: ScreenInfo.height * 0.15,
        ),
        SvgPicture.asset(
          'assets/vectors/Component 2.svg',
          height: ScreenInfo.height * 0.15,
        ),
        SvgPicture.asset(
          'assets/vectors/code_it.svg',
          height: ScreenInfo.height * 0.05,
          width: ScreenInfo.width * 0.05,
        ),
      ],
    );
  }
}