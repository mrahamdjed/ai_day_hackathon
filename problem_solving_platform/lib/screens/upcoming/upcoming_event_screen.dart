import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/my_text_form_field.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';
import 'package:problem_solving_platform/screens/landing/widgets/my_app_bar.dart';
import 'package:problem_solving_platform/screens/ongoing/widgets/event_card.dart';
import 'package:problem_solving_platform/screens/sign_in/widgets/my_app_bar_sign_in.dart';

class UpcomingEventScreen extends StatelessWidget {
  const UpcomingEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenInfo.height = MediaQuery.of(context).size.height;
    ScreenInfo.width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF34333A),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
          child: Column(children: [
            MyAppBarSignIn(),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                CustomBox(
                  borderRadius: 6,
                  padding: 10,
                  height: 45,
                  child: Center(
                    child: Text('Ongoing Events',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: "WorkSans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                CustomBox(
                  borderRadius: 10,
                  child: Center(
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                          color: Color(0xFF34333A),
                          fontFamily: "WorkSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  padding: 14,
                  gradient: LinearGradient(
                      colors: [Color(0xFFDE5B32), Color(0xFFFF9315)]),
                ),
                CustomBox(
                  borderRadius: 6,
                  padding: 10,
                  height: 45,
                  child: Center(
                    child: Text('Past',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: "WorkSans",
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
                width: ScreenInfo.width * 0.98,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Color(0xFF3E3D44),
                ),
                padding: EdgeInsets.all(24),
                child: SizedBox(
                  height: ScreenInfo.height * 0.9,
                  child: EventCard()
                  ))
          ]),
        ),
      ),
    );
  }
}
