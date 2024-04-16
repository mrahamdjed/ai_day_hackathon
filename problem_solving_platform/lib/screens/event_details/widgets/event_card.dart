import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 605), 
      itemCount: 3,
      itemBuilder: (context, index) {
        return GridCard();
      },
    );
  }
}

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Color(0xFF34333A),
          borderRadius: 
          BorderRadius.all(Radius.circular(20.0),),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Container(
                  height: ScreenInfo.width * 0.2,
                decoration: BoxDecoration(
                color: Color(0xFF575454).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/vectors/Component 4.svg',
                    width: ScreenInfo.width * 0.1,
                    height: ScreenInfo.width * 0.1,
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                    height: ScreenInfo.height * 0.15,
                                    decoration: BoxDecoration(
                                    color: Color(0xFF575454).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Starting time',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "WorkSans",
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GradientText(
                          '15-04-24\n19:00 pm',
                          gradient: LinearGradient(
                      colors: [Color(0xFFDE5B32), Color(0xFFFF9315)]),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "WorkSans"
                          ),
                        ),
                      ],
                    ),
                                    ),
                                  ),
                  ),
                  SizedBox(width: 25,),
                  Expanded(
                    child: Container(
                    height: ScreenInfo.height * 0.15,
                                    decoration: BoxDecoration(
                                    color: Color(0xFF575454).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Duration',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "WorkSans",
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GradientText(
                          '04:00:00 ',
                          gradient: LinearGradient(
                      colors: [Color(0xFFDE5B32), Color(0xFFFF9315)]),
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "WorkSans"
                          ),
                        ),
                      ],
                    ),
                                    ),
                                  ),
                  )
                ],
              ),
              SizedBox(height: 25,),
              CustomBox(
                  borderRadius: 10,
                  border: Border.all(color: Colors.white.withOpacity(0.075),width: 1),
                  child: Center(
                    child: Text(
                      'Spots : 400 (Limited)',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "WorkSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  padding: 10,
                ),
                SizedBox(height: 20,),
              const CustomBox(
                  borderRadius: 10,
                  child: Center(
                    child: Text(
                      'See Statistics',
                      style: TextStyle(
                          color: Color(0xFF34333A),
                          fontFamily: "WorkSans",
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  padding: 10,
                  gradient: LinearGradient(
                      colors: [Color(0xFFDE5B32), Color(0xFFFF9315)]),
                )
            ],
          ),
        ),
      ),
    );
  }
}