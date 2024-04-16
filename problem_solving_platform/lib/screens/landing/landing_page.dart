import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';
import 'package:problem_solving_platform/screens/landing/widgets/logos_bar.dart';
import 'package:problem_solving_platform/screens/landing/widgets/my_app_bar.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenInfo.height = MediaQuery.of(context).size.height;
    ScreenInfo.width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFF34333A),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
          child: Column(
            children: [
              MyAppBar(),
              SizedBox(
                height: 0.4,
              ),
              SizedBox(
                width: ScreenInfo.width * 0.3,
                height: ScreenInfo.height * 0.25,
                child: SvgPicture.asset(
                  'assets/vectors/Component 9.svg'
                ),
              ),
              SizedBox(
                width: ScreenInfo.width * 0.5,
                child: Text(
                  'participate in thrilling event, chose the mode that best suits you! Solo or in team , climb the ranks and rank first , solve the bigest number of challenges and rank first',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF97959F),
                    fontSize: 16,
                    fontFamily: "WorkSans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 140,),
              LogosBar(),
              Text(
                'Upcoming events',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF97959F),
                  fontSize: 16,
                  fontFamily: "WorkSans",)
              ),
            ]
          ),
        ),
      ),
    );
  }
}
