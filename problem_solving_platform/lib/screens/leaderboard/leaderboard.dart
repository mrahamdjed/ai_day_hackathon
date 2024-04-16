import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/my_bottom_bar.dart';
import 'package:problem_solving_platform/core/widgets/my_text_form_field.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';
import 'package:problem_solving_platform/screens/event_details/widgets/my_app_bar_profile.dart';
import 'package:problem_solving_platform/screens/landing/widgets/my_app_bar.dart';
import 'package:problem_solving_platform/core/widgets/event_card.dart';
import 'package:problem_solving_platform/screens/sign_in/widgets/my_app_bar_sign_in.dart';

class LeaderBoard extends StatelessWidget {
  const LeaderBoard ({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenInfo.height = MediaQuery.of(context).size.height;
    ScreenInfo.width = MediaQuery.of(context).size.width;
    var optionDescriptions = ['Score : 10000','Score : 5000','Score : 10000'];
    var optionNames = ['TEAM ALPHA',"TEAM BETA",'TEAM GAMMA'];

    return Scaffold(
      backgroundColor: Color(0xFF34333A),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(children: [
            MyAppBarProfile(),
            SizedBox(
              height: 16,
            ),
            SvgPicture.asset('assets/vectors/CyberQuest.svg'),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBox(borderRadius: 10, padding: 10,
                    color: Color(0xFF3E3D44),
                    width: 180,
                    child: Center(
                      child: Text('Go back',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "WorkSans",
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),),
                    ),
                  ),
                  Row(
                    children: [
                      Text('Total score :',style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontFamily: "WorkSans",
                        fontSize: 16,
                      ),),
                      GradientText(' 2390', gradient: LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)]),style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontFamily: "WorkSans",
                        fontSize: 16,
                      ))
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                color: Color(0xFF3E3D44),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  height: 800,
                  child: ListView.builder(itemCount: optionNames.length,itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        OptionItem(index: index,optionName: optionNames[index], optionDescription: optionDescriptions[index]),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.4),blurRadius: 10,)
                            ]
                          ),
                          child: CustomBox(
                            width: 80,
                            height: 80,
                            borderRadius: 10, padding: 8,
                            gradient: index == 0 ? LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)]) : null,
                            color: index != 0 ? Color(0xFF3E3D44) : null,
                            child: Center(
                              child: Text('${index+1}',
                                 style: TextStyle(
                                  color: Colors.white,
                          fontWeight: index == 0 ? FontWeight.bold : FontWeight.w300,
                          fontFamily: "WorkSans",
                          fontSize: 48,
                                 ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },),
                )
              ),
            ),
            MyBottomBar()
          ]),
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  const OptionItem({
    super.key, required this.optionName, required this.optionDescription, required this.index,
  });
  final String optionName;
  final String optionDescription;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenInfo.width * 0.98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.all(24),
        child: OptionItemReal(index: index,optionName: optionName, optionDescription: optionDescription));
  }
}

class OptionItemReal extends StatelessWidget {
  const OptionItemReal({
    super.key,
    required this.optionName,
    required this.optionDescription, required this.index,
  });

  final String optionName;
  final String optionDescription;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: ScreenInfo.width * 0.9,
          height: index == 0 ? ScreenInfo.height * 0.25 : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index != 0 ? Color(0xFF34333A) : null,
            gradient: index == 0 ? LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)]) : null
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(
                  optionName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index != 0 ? Colors.white : Color(0xFF34333A),
                    fontSize: 24,
                    fontFamily: "WorkSans",
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  optionDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: index != 0 ? Colors.white : Color(0xFF34333A),
                    fontFamily: "WorkSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
                                ),
          ))
      ],
    );
  }
}
