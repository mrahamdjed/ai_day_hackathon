import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/user_repository/user_repository.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';
import 'package:problem_solving_platform/screens/sign_in/sign_in_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      color: const Color(0xFF34333A),
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
            child: Padding(
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
                          const AutoSizeText(
                            'Home',
                            minFontSize: 18,
                            style: TextStyle(
                                color: Color(0xFF97959F),
                                fontFamily: 'WorkSans',
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: 50,
                            height: 1,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(colors: [
                              Color(0xFFDE5B32),
                              Color(0xFFFF9315)
                            ])),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      const GradientText('Events',
                          style: TextStyle(
                              fontFamily: 'WorkSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                          gradient: LinearGradient(
                              colors: [Color(0xFFDE5B32), Color(0xFFFF9315)])),
                    ],
                  ),
                  SizedBox(
                    width: ScreenInfo.height * 0.4,
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider(
                                            create: (context) => SignInBloc(
                                                RepositoryProvider.of<
                                                    UserRepository>(context)),
                                          ),
                                          BlocProvider.value(
                                            value: context.read<AuthenticationBloc>(),
                                          ),
                                        ],
                                        child: const SignInScreen(),
                                      )));
                            },
                            child: CustomBox(
                              borderRadius: 6,
                              padding: 10,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.075),
                                  width: 1),
                              width: 90,
                              height: 45,
                              color: const Color(0xFF34333A),
                              child: const Center(
                                child: Text('Sign in',
                                    style: TextStyle(
                                        color: Color(0xFF97959F),
                                        fontFamily: "WorkSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Supabase.instance.client.auth.signUp(email: "amdjed@gmail.com",password: "1234567");
                            },
                            child: CustomBox(
                              borderRadius: 6,
                              padding: 10,
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.075),
                                  width: 1),
                              width: 90,
                              height: 45,
                              gradient: const LinearGradient(
                                  colors: [Color(0xFFDE5B32), Color(0xFFFF9315)]),
                              child: const Center(
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        color: Color(0xFF34333A),
                                        fontFamily: "WorkSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
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
