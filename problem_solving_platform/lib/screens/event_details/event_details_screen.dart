import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/backend/event/event_repository/model/event_model.dart';
import 'package:problem_solving_platform/backend/event/provider/event_provider.dart';
import 'package:problem_solving_platform/backend/game_single/game_single_repository/game_single_repository.dart';
import 'package:problem_solving_platform/backend/game_single/game_single_repository/model/game_single_model.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/my_text_form_field.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';
import 'package:problem_solving_platform/screens/event_details/widgets/my_app_bar_profile.dart';
import 'package:problem_solving_platform/screens/landing/widgets/my_app_bar.dart';
import 'package:problem_solving_platform/screens/ongoing/widgets/event_card.dart';
import 'package:problem_solving_platform/screens/sign_in/widgets/my_app_bar_sign_in.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  final EventModel eventModel;
  const EventDetailsScreen({super.key, required this.eventModel});

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
            MyAppBarProfile(),
            SizedBox(
              height: 16,
            ),
            SvgPicture.asset('assets/vectors/CyberQuest.svg'),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                color: Color(0xFF3E3D44),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    OptionItem(optionName: 'JOIN A TEAM',optionDescription: 'team up with an already existing team, build your strategie and win',),
                    OptionItem(optionName: 'CREATE A TEAM',optionDescription: 'create a Your own team, invit your friends and win the game',),
                    GestureDetector(
                      onTap: (){
                        GameSingleRepository.joinSingleGame(eventModel.event_id, context.read<AuthenticationBloc>().state.myUserModel!.id);
                      },
                      child: OptionItem(optionName: 'GO SOLO',optionDescription: 'lone wolf? or maybe just too lazy to go search for a team?\nwell we’ve thought about you!',)),
                  ],
                ),
              ),
            )
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 GradientText(
                  optionName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "WorkSans",
                    fontWeight: FontWeight.bold,
                  ),
                  gradient: LinearGradient(colors: [Color(0xFFDE5B32),Color(0xFFFF9315)]),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  optionDescription,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "WorkSans",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                
              ],
                                ),
          ))
      ],
    );
  }
}
