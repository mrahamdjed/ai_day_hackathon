import 'package:flutter/material.dart';
import 'package:problem_solving_platform/screens/event_challenges/event_challenges_screen.dart';
import 'package:problem_solving_platform/screens/event_details/event_details_screen.dart';
import 'package:problem_solving_platform/screens/landing/landing_page.dart';
import 'package:problem_solving_platform/screens/sign_in/sign_in_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EventChallengesScreen();
  }
}