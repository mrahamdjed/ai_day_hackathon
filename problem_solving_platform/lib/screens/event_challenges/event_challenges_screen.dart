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

class EventChallengesScreen extends StatelessWidget {
  const EventChallengesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenInfo.height = MediaQuery.of(context).size.height;
    ScreenInfo.width = MediaQuery.of(context).size.width;
    var optionDescriptions = ['test',"zdsqdq"];
    var optionNames = ['kqscgqskjch','jhjhj'];

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
                      child: Text('LeaderBoard',
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
                    return Column(
                      children: [
                        OptionItem(optionName: optionNames[index], optionDescription: optionDescriptions[index]),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Color(0xFF3E3D44),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.upload_file,color: Color(0xFF7E869E) ,)
                            ),
                          ),
                        ),
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
    super.key, required this.optionName, required this.optionDescription,
  });
  final String optionName;
  final String optionDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenInfo.width * 0.98,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        padding: EdgeInsets.all(24),
        child: OptionItemReal(optionName: optionName, optionDescription: optionDescription));
  }
}

class OptionItemReal extends StatelessWidget {
  const OptionItemReal({
    super.key,
    required this.optionName,
    required this.optionDescription,
  });

  final String optionName;
  final String optionDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: ScreenInfo.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF34333A),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GradientText(
                    '20 PTS',
                    gradient: LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)])),
                ),
                 Text(
                  optionName,
                  style: TextStyle(
                    color: Colors.white,
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
                  style: TextStyle(
                    color: Colors.white,
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
