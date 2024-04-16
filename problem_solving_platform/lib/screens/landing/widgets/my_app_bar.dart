import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      color: Color(0xFF34333A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/vectors/Component 4.svg',
            height: 70,
          ),
          Container(
            width: ScreenInfo.width * 0.6,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.05),
            ),
            child :  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            'Home',
                            minFontSize: 18,
                            style: TextStyle(
                              color: Color(0xFF97959F),
                              fontFamily: 'WorkSans',
                              fontWeight: FontWeight.w400
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 1,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)])
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: 35,),
                      GradientText(
                        'Events', 
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                        gradient: LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)])),
                    ],
                  ),
                  SizedBox(
                    width: ScreenInfo.height * 0.4,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomBox(
                            borderRadius: 6,
                            padding: 10,
                            border: Border.all(color: Colors.white.withOpacity(0.075),width: 1),
                            width: 90,
                            height: 45,
                            color: Color(0xFF34333A),
                            child: Center(
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Color(0xFF97959F),
                                  fontFamily: "WorkSans",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ) 
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          child: CustomBox(
                            borderRadius: 6,
                            padding: 10,
                            border: Border.all(color: Colors.white.withOpacity(0.075),width: 1),
                            width: 90,
                            height: 45,
                            gradient: LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)]),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Color(0xFF34333A),
                                  fontFamily: "WorkSans",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400
                                ) 
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}