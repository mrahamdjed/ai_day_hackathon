import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:problem_solving_platform/backend/my_user/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:problem_solving_platform/core/widgets/custom_box.dart';
import 'package:problem_solving_platform/core/widgets/gradient_text.dart';
import 'package:problem_solving_platform/core/widgets/my_text_form_field.dart';
import 'package:problem_solving_platform/core/widgets/screen_info.dart';
import 'package:problem_solving_platform/screens/landing/widgets/my_app_bar.dart';
import 'package:problem_solving_platform/screens/sign_in/widgets/my_app_bar_sign_in.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    TextEditingController emailCont = TextEditingController();
    TextEditingController passwordCont = TextEditingController();
    ScreenInfo.height = MediaQuery.of(context).size.height;
    ScreenInfo.width = MediaQuery.of(context).size.width;
    bool activeSignIn = true;
    String? errMsg;

    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {

        if(context.read<AuthenticationBloc>().state.authenticationStatus == AuthenticationStatus.authenticated)
        {
          Navigator.of(context).pop();
        }
        if(state is SignInProcess || state is SignInSuccess){
          activeSignIn = false;
        }else{
          activeSignIn = true;
        }

        if(state is SignInFailure){
          errMsg=state.message;
        }

        return Scaffold(
          backgroundColor: Color(0xFF34333A),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Column(children: [
                MyAppBarSignIn(),
                SizedBox(
                  height: 0.4,
                ),
                Container(
                    width: ScreenInfo.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Color(0xFF3E3D44),
                    ),
                    padding: EdgeInsets.all(24),
                    child: Column(children: [
                      Text(
                        "SIGN IN",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "WorkSans",
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      MyTextFormField(
                          controller: emailCont,
                          borderRadius: 10,
                          fillColor: Color(0xFF34333A),
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontFamily: "WorkSans",
                            fontSize: 14,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      MyTextFormField(
                          controller: passwordCont,
                          borderRadius: 10,
                          fillColor: Color(0xFF34333A),
                          hintText: "Password",
                          obscureText: true,
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontFamily: "WorkSans",
                            fontSize: 14,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        '*Use at least 8 characters, one uppercase letter, one lowercase letter and one number in your password',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontFamily: "WorkSans",
                            fontSize: 12),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot password?',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "WorkSans",
                                  fontSize: 14)),
                          SizedBox(width: 6),
                          GradientText('Reset your password',
                              gradient: LinearGradient(colors: [
                                Color(0xFFDE5B32),
                                Color(0xFFFF9315)
                              ])),
                        ],
                      ),
                      SizedBox(
                        height: 28,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomBox(
                              borderRadius: 6,
                              padding: 10,
                              width: 90,
                              height: 45,
                              child: Center(
                                child: Text('Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "WorkSans",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                              ),
                            ),
                          ),
                          Expanded(
                              child: activeSignIn ?
                              GestureDetector(
                            onTap: () async {
                              context.read<SignInBloc>().add(SignInRequired(emailCont.text, passwordCont.text));
                            },
                            child: CustomBox(
                              borderRadius: 10,
                              child: Center(
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Color(0xFF34333A),
                                      fontFamily: "WorkSans",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              padding: 8,
                              gradient: LinearGradient(colors: [
                                Color(0xFFDE5B32),
                                Color(0xFFFF9315)
                              ]),
                            ),
                          )
                          :
                          const CircularProgressIndicator()
                          ),
                        ],
                      )
                    ]))
              ]),
            ),
          ),
        );
      },
    );
  }
}
